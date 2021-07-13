{ 
  system ? builtins.currentSystem
, pkgs ? import ./nix/current_host/nixpkgs.nix { inherit system; }
, ...
}:

let
  name = "nickel-kubernetes";
  nativeBuildInputs = with pkgs; [ 
    cargo
    nix
  ];

  shell = pkgs.mkShell {
    inherit name nativeBuildInputs;

    shellHook = ''
      export TERM=xterm
      echo 'Welcome to ${name} development shell!'
    '';
  };
in { 
  shell = shell; 
}
