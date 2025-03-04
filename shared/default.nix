{
  lib,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.default
    ./options.nix
    ./users.nix
    ./desktop/default.nix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      customConfig = config.custom;
    };
    users = {
      "ndelobel" = import ./home/default.nix;
    };
  };

  system.userActivationScripts = {
    removeConflictingFiles = {
      text = ''
        find ~ -type f -name "*.hmbkp" -delete
      '';
    };
  };

  home-manager.backupFileExtension = "hmbkp";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Paris";

  console.keyMap = "fr";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  documentation.nixos.enable = false;

  networking.networkmanager.enable = true;

  programs.gamemode = lib.mkIf config.custom.gaming.enable {
    enable = true;
  };
}
