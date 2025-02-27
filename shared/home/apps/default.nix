{ pkgs, ... }: {
  imports = [ ./gaming.nix ];

  programs.git = {
    enable = true;
    userName = "ndelobel";
    userEmail = "nathan.delobel@protonmail.com";
  };

  programs.firefox.enable = true;
}
