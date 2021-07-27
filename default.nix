{ system ? builtins.currentSystem
, pkgs ? import ./nix/current_host/nixpkgs.nix { inherit system; }, nickel, ...
}:

let
  name = "nickel-kubernetes";
  k8s_versions_sha256 = {
    "1.12.10" = "wOd5lOKKI6AY5dLTdbdzfLq6HdDspSt+q8H3LQlIPZ4=";
    "1.13.12" = "TycofoLG9DBNv5nxxo2rEsHFtUBlgpYFfUeuoGjhzNk=";
    "1.14.10" = "uSMIglMlax7RYx+48yMo0ImEWDp/McWMGi2Vkm9x8gQ=";
    "1.15.12" = "R6Mz/vESlOi9/spIp05n+0OPP/pCeFbTxEPRryz3etQ=";
    "1.16.15" = "g6Ju9hQaaPt9y4oYnIma7FXXHb7WdlteBXy7puFFMBs=";
    "1.17.17" = "E1EVx3lc5+Hs7u80MBofgvyZcjFGJyYbkL+JE+Jtkvo=";
    "1.18.20" = "wWtHRGA6WplBxsZW/+qavoV/azmwLYYgUEUwt5BteDg=";
    "1.19.13" = "ZXxonUAUxRK6rhTgK62ytTdDKCuOoWPwxJmktiKgcJc=";
    "1.20.9" = "xzVOarQDSomHMimpt8H6MfpiQrLl9am2fDvk/GfLkDw=";
    "1.21.3" = "EoqYTbtaTlzs7vneoNtXUmdnjTM/U+1gYwCiEy0lOcw=";
  };
  kubernetes_open_api_specs = pkgs.lib.mapAttrs (version: sha256:
    pkgs.fetchurl {
      url =
        "https://raw.githubusercontent.com/kubernetes/kubernetes/v${version}/api/openapi-spec/swagger.json";
      sha256 = sha256;
    }) k8s_versions_sha256;
  nativeBuildInputs = with pkgs; [ cargo nickel nix nixfmt rustfmt ];

  shell = pkgs.mkShell {
    inherit name nativeBuildInputs;

    shellHook = ''
      export TERM=xterm

      # Populate k8s-openapi-v2-specs
      ${pkgs.lib.foldl (p: c: p + "\n" + c) "" (pkgs.lib.mapAttrsToList
        (version: path: "ln -fs ${path} ./k8s-openapi-v2-specs/${version}.json")
        kubernetes_open_api_specs)}

      echo 'Welcome to ${name} development shell!'
    '';
  };
in { shell = shell; }
