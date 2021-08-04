{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }
, nickel, ... }:

let
  OPENAPI_SPECS_K8S_DIR = "${openapi_specs.k8s.specs}";

  openapi2_to_nickel = pkgs.rustPlatform.buildRustPackage rec {
    inherit OPENAPI_SPECS_K8S_DIR;

    pname = "openapi2-to-nickel";
    version = "0.1.0";

    src = builtins.path {
      path = ./openapi2-to-nickel;
      name = "openapi2-to-nickel-src";
    };

    cargoHash = "sha256-X2KEjXkjprw6ZbBzVxayam6Ls+3/5Oct8O4LvzhHyDk=";

    # When it lands the stable channel:
    # cargoLock = {
    #   lockFile = ./openapi2-to-nickel/Cargo.lock;
    # };
  };

  openapi_specs = {
    argo_workflows = {
      version_to_sha256 = {
        "3.1.5" = "u2DMqSNDt+wqSeTwYhL44TtzZXXdOcPuvAOQM8w20KM=";
      };
      swagger_files = pkgs.lib.mapAttrs (version: sha256:
        pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/argoproj/argo-workflows/v${version}/api/openapi-spec/swagger.json";
          sha256 = sha256;
        }) openapi_specs.argo_workflows.version_to_sha256;
      specs = pkgs.stdenv.mkDerivation {
        name = "openapi-specs-argo-workflows";
        phases = [ "installPhase" ];

        installPhase = ''
          mkdir -p $out
          ${pkgs.lib.foldl (p: c: p + "\n" + c) "" (pkgs.lib.mapAttrsToList
            (version: path: "ln -fs ${path} $out/${version}.json")
            openapi_specs.argo_workflows.swagger_files)}
        '';
      };
    };
    k8s = {
      version_to_sha256 = {
        "1.12.10" = "o3uZ9N2FDkp3GuIEdVnfnCFQJZ9Hef4+OO3t0eC9qYs=";
        "1.13.12" = "8jUzfeLjIcqXyQJO0P86V5wH/PNqpc41asoOr9sj+28=";
        "1.14.10" = "uSMIglMlax7RYx+48yMo0ImEWDp/McWMGi2Vkm9x8gQ=";
        "1.15.12" = "R6Mz/vESlOi9/spIp05n+0OPP/pCeFbTxEPRryz3etQ=";
        "1.16.15" = "g6Ju9hQaaPt9y4oYnIma7FXXHb7WdlteBXy7puFFMBs=";
        "1.17.17" = "E1EVx3lc5+Hs7u80MBofgvyZcjFGJyYbkL+JE+Jtkvo=";
        "1.18.20" = "wWtHRGA6WplBxsZW/+qavoV/azmwLYYgUEUwt5BteDg=";
        "1.19.13" = "ZXxonUAUxRK6rhTgK62ytTdDKCuOoWPwxJmktiKgcJc=";
        "1.20.9" = "xzVOarQDSomHMimpt8H6MfpiQrLl9am2fDvk/GfLkDw=";
        "1.21.3" = "EoqYTbtaTlzs7vneoNtXUmdnjTM/U+1gYwCiEy0lOcw=";
      };
      swagger_files = pkgs.lib.mapAttrs (version: sha256:
        pkgs.fetchurl {
          url =
            "https://raw.githubusercontent.com/kubernetes/kubernetes/v${version}/api/openapi-spec/swagger.json";
          sha256 = sha256;
        }) openapi_specs.k8s.version_to_sha256;
      specs = pkgs.stdenv.mkDerivation {
        name = "openapi-specs-k8s";
        phases = [ "installPhase" ];

        installPhase = ''
          mkdir -p $out
          ${pkgs.lib.foldl (p: c: p + "\n" + c) "" (pkgs.lib.mapAttrsToList
            (version: path: "ln -fs ${path} $out/${version}.json")
            openapi_specs.k8s.swagger_files)}
        '';
      };
    };
  };

  nickel_defs = {
    all = pkgs.stdenv.mkDerivation {
      name = "nickel-kubernetes-defs";
      phases = [ "installPhase" ];

      installPhase = ''
        mkdir -p $out/argo_workflows
        cp -R ${nickel_defs.argo_workflows}/* $out/argo_workflows
        mkdir -p $out/kubernetes
        cp -R ${nickel_defs.k8s}/* $out/kubernetes
      '';
    };
    argo_workflows = pkgs.stdenv.mkDerivation {
      name = "nickel-argo-workflows";
      phases = [ "buildPhase" "installPhase" ];

      nativeBuildInputs = [ pkgs.coreutils-full openapi2_to_nickel ];

      buildPhase = ''
        for filename in "${openapi_specs.argo_workflows.specs}"/*.json; do
          mkdir -p ./argo_workflows/"$(basename $filename .json)"
          openapi2-to-nickel $filename > ./argo_workflows/"$(basename $filename .json)/argo_workflows.ncl"
        done
      '';

      installPhase = ''
        mkdir -p $out
        mv ./argo_workflows/* $out/
      '';
    };
    k8s = pkgs.stdenv.mkDerivation {
      name = "nickel-k8s";
      phases = [ "buildPhase" "installPhase" ];

      nativeBuildInputs = [ pkgs.coreutils-full openapi2_to_nickel ];

      buildPhase = ''
        for filename in "${openapi_specs.k8s.specs}"/*.json; do
          mkdir -p ./kubernetes/"$(basename $filename .json)"
          openapi2-to-nickel $filename > ./kubernetes/"$(basename $filename .json)/k8s.ncl"
        done
      '';

      installPhase = ''
        mkdir -p $out
        mv ./kubernetes/* $out/
      '';
    };
  };

  shell = pkgs.mkShell {
    inherit OPENAPI_SPECS_K8S_DIR;

    name = "nickel-kubernetes";
    nativeBuildInputs = with pkgs; [ cargo nickel nix nixfmt rustfmt ];

    shellHook = ''
      export TERM=xterm

      # Explicitly expose openapi specs for k8s
      ln -fs ${openapi_specs.k8s.specs} ./openapi-specs-k8s
      ln -fs ${openapi_specs.argo_workflows.specs} ./openapi-specs-argo-workflows

      echo 'Welcome to nickel-kubernetes development shell!'
      echo 'Sup: ${nickel_defs.all}'
    '';
  };
in { shell = shell; nickel_defs = nickel_defs.all; }
