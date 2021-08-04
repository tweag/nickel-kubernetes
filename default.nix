{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }
, nickel, ... }:

let
  name = "nickel-kubernetes";
  openapi_specs = {
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
          ${
            pkgs.lib.foldl (p: c: p + "\n" + c) "" (pkgs.lib.mapAttrsToList
              (version: path: "ln -fs ${path} $out/${version}.json")
              openapi_specs.k8s.swagger_files)
          }
        '';
      };
    };
  };

  nativeBuildInputs = with pkgs; [ cargo nickel nix nixfmt rustfmt ];

  shell = pkgs.mkShell {
    inherit name nativeBuildInputs;

    OPENAPI_SPECS_K8S_DIR = "${openapi_specs.k8s.specs}";

    shellHook = ''
      export TERM=xterm

      # Explicitly expose openapi specs for k8s
      ln -fs ${openapi_specs.k8s.specs} ./openapi-specs-k8s

      echo 'Welcome to ${name} development shell!'
    '';
  };
in { shell = shell; }
