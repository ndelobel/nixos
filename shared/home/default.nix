{ ... }: {
  imports = [
    ./apps/default.nix
    ./theme.nix
    ./gnome.nix
  ];

  home.username = "ndelobel";
  home.homeDirectory = "/home/ndelobel";

  home.stateVersion = "24.11";
}
