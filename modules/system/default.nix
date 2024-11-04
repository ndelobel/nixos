{ ... }:
{
  imports = [
    ./users.nix
    ./desktop.nix
    ./locale.nix
    ./programs.nix
    ./gaming.nix
    ./virtualisation.nix
    ./dev
  ];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
