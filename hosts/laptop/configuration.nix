{ inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./graphics.nix
    ../../modules/system
  ];

  # enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.configurationLimit = 5;
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
    persistent = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # home-manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "ndelobel" = import ./home.nix;
    };

    backupFileExtension = "backup";
  };

  system.stateVersion = "24.05";
}
