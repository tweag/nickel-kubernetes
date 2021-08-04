{
  description = "nickel-kubernetes development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    pkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
    nickel.url = "github:tweag/nickel";
  };

  outputs = { self, nickel, pkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: {
      defaultPackage = (
        import ./default.nix {
          system = system;
          pkgs = pkgs.legacyPackages.${system};
          nickel = nickel.defaultPackage.${system};
        }
      ).nickel_defs;
      devShell = (import ./default.nix {
        system = system;
        pkgs = pkgs.legacyPackages.${system};
        nickel = nickel.defaultPackage.${system};
      }).shell;
    });
}
