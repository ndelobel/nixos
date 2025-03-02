{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.appindicator
    # gnomeExtensions.dash-to-dock

    (whitesur-icon-theme.override { alternativeIcons = true; })
    adw-gtk3
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
        num-workspaces = 1;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          clipboard-indicator.extensionUuid
          appindicator.extensionUuid
          # dash-to-dock.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/blur-my-shell" = {
        "dash-to-dock/blur" = false;
      };
      "org/gnome/shell/extensions/blur-my-shell" = {
        tray-pos = "left";
      };
      # "org/gnome/shell/extensions/dash-to-dock" = {
      #   show-mounts = false;
      #   show-trash = false;
      # };

      "org/gnome/desktop/background" = {
        picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/moon-night.jpg";
        picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/moon-night.jpg";
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file://${config.home.homeDirectory}/.local/share/backgrounds/moon-night.jpg";
        picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/backgrounds/moon-night.jpg";
      };
      "org/gnome/desktop/interface" = {
        icon-theme = "WhiteSur";
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
      };
    };
  };

  home.file.".local/share/backgrounds/moon-night.jpg".source = ../../resources/images/background.jpg;
}
