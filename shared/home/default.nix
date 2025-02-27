{ ... }: {
  imports = [ ./apps/default.nix ];

  home.username = "ndelobel";
  home.homeDirectory = "/home/ndelobel";

  home.stateVersion = "24.11";
}
