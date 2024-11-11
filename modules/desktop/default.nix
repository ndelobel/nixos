{ ... }:
{
  imports = [
    ./gnome.nix
    ./gdm.nix
    ./gtk.nix
  ];

  services.xserver.enable = true;
}
