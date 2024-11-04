{ ... }:
{
  xdg.desktopEntries = {
    xterm = {
      name = "XTerm";
      noDisplay = true;
    };
    vesktop = {
      name = "Discord";
      icon = "discord";
      exec = "vesktop";
    };
    "org.gnome.Extensions" = {
      name = "Gnome extensions";
      noDisplay = true;
    };
  };
}
