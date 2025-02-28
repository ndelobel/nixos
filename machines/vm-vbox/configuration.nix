{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../shared/default.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
       efiSupport = true;
       device = "nodev";
    };
  };

  networking.hostName = "vm-vbox";

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  system.stateVersion = "24.11";
}
