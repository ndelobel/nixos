{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
  };

  # disable gnome bloatwares
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  # gnome extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    appindicator
  ];

  home-manager.users.ndelobel = {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = ":minimize,maximize,close";
        };

        "org/gnome/desktop/background" = {
          picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/glass-chip-l.jxl";
          picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/glass-chip-d.jxl";
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = with pkgs.gnomeExtensions; [
            blur-my-shell.extensionUuid
            dash-to-dock.extensionUuid
            appindicator.extensionUuid
          ];
        };

        "org/gnome/shell/extensions/dash-to-dock" = {
          show-trash = false;
          show-mounts = false;
          running-indicator-style = "DOTS";
          transparency-mode = "DYNAMIC";
          max-alpha = 0.8;
          min-alpha = 0.0;
        };

        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
          blur = false;
        };
      };
    };
  };
}
