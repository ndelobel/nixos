{ pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };
    iconTheme = {
      package = (
        pkgs.whitesur-icon-theme.override {
          alternativeIcons = true;
          boldPanelIcons = true;
        }
      );
      name = "WhiteSur";
    };
  };
}
