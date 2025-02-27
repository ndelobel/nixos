{ lib, pkgs, config, desktopConfig, ... }: {
  home.packages = with pkgs; [
    (whitesur-icon-theme.override { alternativeIcons = true; })
    adw-gtk3
  ];

  home.file.".local/share/backgrounds/moon-night.jpg".source = ../../resources/background.jpg;

  dconf.settings = lib.mkIf (desktopConfig.enable) {
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
}
