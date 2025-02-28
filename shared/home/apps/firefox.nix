{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
    profiles.ndelobel = {
      id = 0;
      isDefault = true;
      search = {
        default = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Nix Options" = {
            definedAliases = [ "@no" ];
            urls = [{
                template = "https://search.nixos.org/options";
                params = [
                    { name = "query"; value = "{searchTerms}"; }
                ];
            }];
          };
        };
      };
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        proton-pass
        ublock-origin
        languagetool
        sponsorblock
      ];
      settings = {
        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
      };
    };
  };
}
