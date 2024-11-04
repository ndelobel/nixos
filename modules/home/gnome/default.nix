{ ... }:
{
  imports = [ ./extensions.nix ];

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
    };
  };
}
