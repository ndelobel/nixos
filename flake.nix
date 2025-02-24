{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    mkSystem = { hostname, system ? "x86_64-linux" }: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
          (./machines + "/${hostname}/machine.nix")
      ];
    };

  in {
    nixosConfigurations = {
      laptop = mkSystem { hostname = "laptop"; };
      vbox = mkSystem { hostname = "vbox"; };
    };
  };
}
