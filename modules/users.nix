{ inputs, ... }:
{
  users.users.ndelobel = {
    isNormalUser = true;
    initialPassword = "password";
    description = "Nathan Delobel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # home-manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };

    useGlobalPkgs = true;

    users.ndelobel = {
      home.username = "ndelobel";
      home.homeDirectory = "/home/ndelobel";
      home.stateVersion = "24.05";
    };

    backupFileExtension = "backup";
  };
}
