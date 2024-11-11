{
  description = "ndelobel nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  output = {...} @ inputs: {
    nixosConfigurations = {
      laptop = {
        specialArgs = {inherit inputs;};
        modules = [./hosts/laptop/configuration.nix];
      };
    };
  };
}
