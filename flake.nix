{
  description = "Nickel libraries and tools to write Kubernetes resources natively in Nickel";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    json-schema-to-nickel.url =
      "github:nickel-lang/json-schema-to-nickel";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        js2nBin =
          inputs.json-schema-to-nickel.packages.${system}.default;

        js2nSrc = inputs.json-schema-to-nickel;

        pkgs = import nixpkgs { inherit system; };

        # K8s JSON schemas of a specific K8s version taken from
        # `kubernetes-json-schema` (as a path)
        k8sSchemasRepo = pkgs.fetchFromGitHub {
          owner = "yannh";
          repo = "kubernetes-json-schema";
          rev = "0fef34d97af594eec495ec49cd5b2a349e4a557f";
          hash = "sha256-Q2K/0mx7AvnVO98mBQB4ZOzWUFpP+O+CM9y+Tvhv/x4=";
        };

        k8sSchemas = { version ? latestK8sVersion }: k8sSchemasRepo + "/${version}-standalone-strict";

        # K8s JSON schemas of a specific K8s version taken from
        # `kubernetes-json-schema` (as a derivation)
        k8sSchemasDrv = { version ? latestK8sVersion }: pkgs.srcOnly {
          name = "k8s-schemas-${version}";
          src = k8sSchemas { inherit version; };
        };

        # Generate Nickel contracts from K8s JSON schemas using
        # `json-schema-to-nickel` for a given version.
        #
        # Pass `keepJsonArtifacts = true` to keep the JSON artifacts (original
        # and processed JSON schemas) for debugging purposes.
        k8sContracts =
          { version ? latestK8sVersion
          , keepJsonArtifacts ? false
          }: k8sContractsBundle {
            versions = [ version ];
            inherit keepJsonArtifacts;
          };

        json-schema-bundler = (pkgs.callPackage ./json-schema-bundler { }).package;

        latestK8sVersion = "v1.34.0";

        # Same as `k8sContracts` but generate contracts for multiple versions at once.
        #
        # Since flakes output can't really be parametrized, if you need to use
        # this derivation, you should manually add the bundle to the `packages`
        # output with the versions you want to process, for example:
        #
        # ```
        # bundle = k8sContractsBundle {
        #   versions = [
        #     "v1.31.0"
        #     "v1.31.1"
        #     "v1.31.2"
        #     "v1.31.3"
        #     "v1.31.4"
        #     "v1.31.5"
        #     "v1.31.6"
        #   ];
        # };
        # ```
        k8sContractsBundle = { versions, keepJsonArtifacts ? false }: pkgs.stdenv.mkDerivation {
          name = "k8s-contracts-bundle";
          srcs = builtins.map (v: k8sSchemas { version = v; }) versions;
          phases = [ "buildPhase" "installPhase" ];
          nativeBuildInputs = [
            pkgs.coreutils-full
            js2nBin
            json-schema-bundler
          ];

          buildPhase = ''
            mkdir contracts
            mkdir bundles
          '' + builtins.concatStringsSep "\n" (builtins.map
            (version: ''
              mkdir "bundles/${version}"
              mkdir "contracts/${version}"
              cp -r "${js2nSrc}/lib" contracts/${version}/.js2n-lib

              for filename in "${k8sSchemas {inherit version;}}"/*.json; do
                basename="$(basename "$filename" .json)"
                bundled="bundles/${version}/$basename-bundled.json"

                json-schema-bundler "$filename" > "$bundled"
                json-schema-to-nickel --library-path .js2n-lib/main.ncl "$bundled" > "./contracts/${version}/$basename.ncl"
              done
            '')
            versions);

          installPhase = ''
            mkdir -p $out
            cp -r ./contracts $out/
          '' + nixpkgs.lib.optionalString keepJsonArtifacts "cp -r ./bundles $out/";
        };

      in
      {
        packages =
          {
            default = inputs.self.packages.${system}.contracts;
            schemas = k8sSchemasDrv { };
            contracts = k8sContracts { };
            inherit json-schema-bundler;
          };

        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.nickel ];
        };
      });
}
