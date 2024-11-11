{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
  ];

  environment.systemPackages = with pkgs; [
    wget
    curl
    glxinfo
    pciutils
    gnome-console
    gnome-disk-utility
    nautilus
    resources
    file-roller
    vesktop
    fragments
    zip

    vlc
    libvlc

    # wine
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
  ];

  home-manager.users.ndelobel.xdg.desktopEntries = {
    xterm = {
      name = "XTerm";
      noDisplay = true;
    };
    vesktop = {
      name = "Discord";
      icon = "discord";
      exec = "vesktop";
    };
    nixos-manual = {
      name = "Nixos Manual";
      noDisplay = true;
    };
    nvidia-settings = {
      name = "Nvidia Settings";
      noDisplay = true;
    };
    virtualbox = {
      name = "VirtualBox";
      icon = "virtualbox";
      exec = "VirtualBox";
    };
  };
}
