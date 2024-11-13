{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.default];

  users.users.ndelobel = {
    isNormalUser = true;
    initialPassword = "password";
    description = "Nathan DELOBEL";
    extraGroups = ["wheel" "networkmanager"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ndelobel = import ../home;
  };
}
