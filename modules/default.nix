{...}: {
  imports = [
    ./users.nix
    ./sound.nix
    ./locale.nix
    ./programs
    ./gaming.nix
    ./virtualisation.nix
    ./desktop
    ./dev.nix
  ];

  programs.nix-ld.enable = true;
  nixpkgs.config.allowUnfree = true;
}
