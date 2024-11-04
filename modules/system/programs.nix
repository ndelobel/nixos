{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    pciutils
    gnome-console
    gnome-disk-utility
    nautilus
    resources
    file-roller
    zed-editor
    firefox
    vesktop
  ];
}
