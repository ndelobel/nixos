{ config, lib, ... } : {
  imports = [ ./gnome.nix ];

  options = {
    desktop = {
      enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
      };
      environment = lib.mkOption {
          type = lib.types.str;
          default = "gnome";
      };
    };
  };

  config = lib.mkIf config.desktop.enable {
    # Enable the windowing system
    services.xserver.enable = true;

    # Configure keymap in X11/Wayland
    services.xserver.xkb = {
      layout = "fr";
      variant = "azerty";
    };

    # Enable sound
    security.rtkit.enable = true;
    services.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
