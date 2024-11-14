{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
  ];

  # ====== boot loader ======
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      theme = null;
    };
  };

  # ====== network ======
  networking.hostName = "vbox";
  networking.networkmanager.enable = true;

  # ====== virtualbox ======
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;

  system.stateVersion = "24.05";
}
