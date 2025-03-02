{
  pkgs,
  inputs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.ndelobel = {
      id = 0;
      isDefault = true;
      search = {
        default = "DuckDuckGo";
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
        "browser.toolbars.bookmarks.visibility" = "never";
        "extensions.pocket.enabled" = false;
        "identity.fxaccounts.enabled" = false;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "gnomeTheme.systemIcons" = true;
        "gnomeTheme.noThemedIcons" = true;
      };
      userChrome = ''
        @import "${inputs.firefox-gnome-theme}/userChrome.css";
        @import "${inputs.firefox-gnome-theme}firefox-gnome-theme/theme/colors/dark.css";
      '';
    };
  };
}
