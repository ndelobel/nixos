{ config, lib, pkgs, ... }: {
  imports = [
    ./gnome.nix
  ];

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
    services.xserver = {
      enable = true;
      xkb = {
        layout = "fr";
        variant = "azerty";
      };
      excludePackages = with pkgs; [ xterm ];
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
