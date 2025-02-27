{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ../../shared/default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vm-vbox";
  networking.networkmanager.enable = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  system.stateVersion = "24.11";
}
