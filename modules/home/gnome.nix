{pkgs, ...}: {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    appindicator
  ];

  dconf = {
    enable = true;
    settings = {
      # dark theme
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };

      # window decorations
      "org/gnome/desktop/wm/preferences" = {
        button-layout = ":minimize,maximize,close";
      };

      # wallpaper
      "org/gnome/desktop/background" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/glass-chip-l.jxl";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/glass-chip-d.jxl";
      };

      # extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          dash-to-dock.extensionUuid
          appindicator.extensionUuid
        ];
      };

      # extensions settings
      "org/gnome/shell/extensions/dash-to-dock" = {
        show-trash = false;
        show-mounts = false;
        running-indicator-style = "DOTS";
      };
      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = false;
      };
    };
  };
}
