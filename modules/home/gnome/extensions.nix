{ pkgs, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
        dash-to-dock.extensionUuid
        tray-icons-reloaded.extensionUuid
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

    "org/gnome/shell/extensions/trayIconsReloaded" = {
      icons-limit = 1;
    };
  };
}
