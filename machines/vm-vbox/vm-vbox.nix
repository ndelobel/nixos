{ config, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ../../shared/default.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "vm-vbox";

  networking.networkmanager.enable = true;

  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;

  users.users.ndelobel = {
    isNormalUser = true;
    description = "Nathan Delobel";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  system.stateVersion = "24.11";
}
