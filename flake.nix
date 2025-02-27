{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    mkSystem = { hostname, system ? "x86_64-linux" }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
          inputs.home-manager.nixosModules.default
          (./machines + "/${hostname}/${hostname}.nix")
      ];
    };

  in {
    nixosConfigurations = {
      laptop = mkSystem { hostname = "laptop"; };
      vm-vbox = mkSystem { hostname = "vm-vbox"; };
    };
  };
}
