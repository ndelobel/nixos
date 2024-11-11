{inputs, ...}: {
  users.users.ndelobel = {
    isNormalUser = true;
    initialPassword = "password";
    description = "Nathan DELOBEL";
    extraGroups = ["wheel" "networkmanager"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "ndelobel" = import ../home;
    };
  };
}
