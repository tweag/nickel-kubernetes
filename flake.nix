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

        k8sSchemas = { version ? latestK8sVersion }: k8sSchemasRepo + "/${version}";

        # K8s JSON schemas of a specific K8s version taken from
        # `kubernetes-json-schema` (as a derivation)
        k8sSchemasDrv = { version ? latestK8sVersion }: pkgs.srcOnly {
          name = "k8s-schemas-${version}";
          src = k8sSchemas { inherit version; };
        };

        # Generate Nickel contracts from K8s JSON schemas using
        # `json-schema-to-nickel`.
        k8sContracts = { version ? latestK8sVersion }: pkgs.stdenv.mkDerivation {
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
              basename="$(basename $filename .json)"
              urlRewritten="$basename-url-rewritten.json"
              bundled="$basename-bundled.json"

              # Rewrite ref URLs to local file accesses, which we can do because
              # all references are actually local and pointing to the
              # kubernetes-json-schema repository, which is already in the store
              sed 's%"\$ref": "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master%"$ref": "${k8sSchemasRepo}%g' "$filename" > "$urlRewritten"

              json-schema-bundler "$urlRewritten" > "$bundled"
              json-schema-to-nickel "$bundled" > ./contracts/"$basename".ncl
            done
          '';

          installPhase = ''
            mkdir -p $out
            mv ./*.json $out/
            mv ./contracts $out
          '';
        };

        json-schema-bundler = (pkgs.callPackage ./json-schema-bundler { }).package;

        latestK8sVersion = "v1.29.3";
      in
      {
        packages =
          # avoid the recursive capture of `json-schema-bundler`
          let json-schema-bundler' = json-schema-bundler; in
          rec {
            default = contracts;
            schemas = k8sSchemasDrv { };
            contracts = k8sContracts { };
            json-schema-bundler = json-schema-bundler';
          };

        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.nickel ];
        };
      });
}
