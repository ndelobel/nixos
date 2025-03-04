{ pkgs, ... }:
{
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    geary
    epiphany
    gnome-secrets
    gnome-console
    gnome-calendar
    gnome-system-monitor
    gnome-characters
    gnome-tour
    gnome-user-docs
    gnome-text-editor
    gnome-calculator
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-weather
    gnome-music
    gnome-clocks
    gnome-connections
    simple-scan
    snapshot
    totem
    yelp
    gnome-software
  ];

  services.gnome.gnome-remote-desktop.enable = false;
}
