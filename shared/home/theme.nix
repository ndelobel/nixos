{ lib, pkgs, config, desktopConfig, ... }: {
  home.packages = with pkgs; [
    (whitesur-icon-theme.override { alternativeIcons = true; })
  ];

  home.file.".local/share/backgrounds/moon-night.jpg".source = ../../resources/moon-night.jpg;

  dconf.settings = lib.mkIf (desktopConfig.enable && desktopConfig.environment == "gnome") {
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
    };
  };
}
