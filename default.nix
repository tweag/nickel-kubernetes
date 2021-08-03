{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }
, nickel, ... }:

let
  name = "nickel-kubernetes";
  k8s_versions_sha256 = {
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
  kubernetes_open_api_specs_files = pkgs.lib.mapAttrs (version: sha256:
    pkgs.fetchurl {
      url =
        "https://raw.githubusercontent.com/kubernetes/kubernetes/v${version}/api/openapi-spec/swagger.json";
      sha256 = sha256;
    }) k8s_versions_sha256;
  nativeBuildInputs = with pkgs; [ cargo nickel nix nixfmt rustfmt ];

  kubernetes_open_api_specs = pkgs.stdenv.mkDerivation {
    name = "kubernetes-openapi-specs";
    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out
      ${
        pkgs.lib.foldl (p: c: p + "\n" + c) "" (pkgs.lib.mapAttrsToList
          (version: path: "ln -fs ${path} $out/${version}.json")
          kubernetes_open_api_specs_files)
      }    
    '';
  };

  shell = pkgs.mkShell {
    inherit name nativeBuildInputs;

    K8S_NICKEL_SPECS_DIR = "${kubernetes_open_api_specs}";

    shellHook = ''
      export TERM=xterm

      # Expose k8s openapi spec files
      ln -fs ${kubernetes_open_api_specs} ./k8s-openapi-v2-specs

      echo 'Welcome to ${name} development shell!'
    '';
  };
in { shell = shell; }
