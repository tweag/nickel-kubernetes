{
  description = "nickel-kubernetes development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, pkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        devShell = (
          import ./default.nix {
            system = system;
            pkgs = pkgs.legacyPackages.${system};
          }
        ).shell;
      }
    );
}
