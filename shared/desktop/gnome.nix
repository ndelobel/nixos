{ config, lib, ... } : {
  config = lib.mkIf (config.desktop.enable && config.desktop.environment == "gnome") {
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
