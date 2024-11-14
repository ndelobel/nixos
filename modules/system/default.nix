{...}: {
  imports = [
    ./users.nix
    ./desktop.nix
    ./locale.nix
  ];

  config = {
    nix.settings.experimental-features = ["nix-command" "flakes"];
    programs.nix-ld.enable = true;
    nixpkgs.config.allowUnfree = true;
  };
}
