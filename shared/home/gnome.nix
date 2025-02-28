{ lib, pkgs, desktopConfig, ... }: {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    clipboard-indicator
    appindicator
    # dash-to-dock
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout= "appmenu:minimize,maximize,close";
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
    };
  };
}
