{...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  boot = {
    loader.grub = {
      enable = true;
      device = "nodev";
      theme = null;
    };
  };

  networking = {
    hostName = "laptop";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
