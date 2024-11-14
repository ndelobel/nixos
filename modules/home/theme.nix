{pkgs, ...}: let
  whitesur-icon-theme-unstable = pkgs.whitesur-icon-theme.overrideAttrs (oldAttrs: rec {
    version = "unstable-commit";
    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Whitesur-icon-theme";
      rev = "092d17fb1abaf0ea15eefc15d2e145a3737b45ea";
      hash = "sha256-l4NMZ/sG34tlbSki9bgGmRVtDPcT5eZU1iIMoEux19o=";
    };
  });
in {
  gtk = {
    enable = true;
    iconTheme = {
      package = (
        whitesur-icon-theme-unstable.override {
          alternativeIcons = true;
          boldPanelIcons = true;
        }
      );
      name = "WhiteSur";
    };
  };

  dconf.settings = {
    # dark theme
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
