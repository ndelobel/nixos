{
  description = "Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs:
  let
    mkSystem = { hostname, system ? "x86_64-linux" }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [ (./machines + "/${hostname}/configuration.nix") ];
    };

  in {
    nixosConfigurations = {
      laptop = mkSystem { hostname = "laptop"; };
      vm-vbox = mkSystem { hostname = "vm-vbox"; };
    };
  };
}
