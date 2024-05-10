{
  description = "nickel-kubernetes: Nickel libraries and tools to write Kubernetes resources natively in Nickel";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    json-schema-to-nickel.url = "github:nickel-lang/json-schema-to-nickel";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        json-schema-to-nickel =
          inputs.json-schema-to-nickel.packages.${system}.default;

        pkgs = import nixpkgs { inherit system; };

        # K8s JSON schemas of a specific K8s version taken from
        # `kubernetes-json-schema` (as a path)
        k8sSchemasRepo = pkgs.fetchFromGitHub {
          owner = "yannh";
          repo = "kubernetes-json-schema";
          rev = "f8b907d7210830dfecbf976c2ba3c849bcf0cace";
          hash = "sha256-Vd3iHeB7LvFDNu+m/RE2P6zgRhNJemiE+j1AAuc6swo=";
        };

        k8sSchemas = { version ? latestK8sVersion }: k8sSchemasRepo + "/${version}-standalone-strict";

        # K8s JSON schemas of a specific K8s version taken from
        # `kubernetes-json-schema` (as a derivation)
        k8sSchemasDrv = { version ? latestK8sVersion }: pkgs.srcOnly {
          name = "k8s-schemas-${version}";
          src = k8sSchemas { inherit version; };
        };

        # Generate Nickel contracts from K8s JSON schemas using
        # `json-schema-to-nickel`.
        #
        # Pass `keepJsonArtifacts = true` to keep the JSON artifacts (original
        # and processed JSON schemas) for debugging purposes.
        k8sContracts = { version ? latestK8sVersion, keepJsonArtifacts ? false }: pkgs.stdenv.mkDerivation {
          name = "k8s-contracts-${version}";
          src = k8sSchemas { inherit version; };
          phases = [ "buildPhase" "installPhase" ];
          nativeBuildInputs = [
            pkgs.coreutils-full
            json-schema-to-nickel
            json-schema-bundler
          ];

          buildPhase = ''
            mkdir -p contracts

            for filename in "${k8sSchemas {inherit version;}}"/*.json; do
              basename="$(basename "$filename" .json)"
              bundled="$basename-bundled.json"

              json-schema-bundler "$filename" > "$bundled"
              json-schema-to-nickel "$bundled" > ./contracts/"$basename".ncl
            done
          '';

          installPhase = ''
            mkdir -p $out
            mv ./contracts $out

          '' + nixpkgs.lib.optionalString keepJsonArtifacts "mv ./*.json $out/";
        };

        json-schema-bundler = (pkgs.callPackage ./json-schema-bundler { }).package;

        latestK8sVersion = "v1.29.3";
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
