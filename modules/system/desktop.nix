{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
  };

  # disable gnome bloatwares
  services.gnome.core-utilities.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
  ];

  # gnome extensions
  environment.systemPackages = with pkgs.gnomeExtensions; [
    blur-my-shell
    dash-to-dock
    tray-icons-reloaded
  ];

  # sound (pipewire)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
