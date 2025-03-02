{ pkgs, ... }:
{
  imports = [
    ./editor.nix
    ./gaming.nix
    ./firefox.nix
  ];

  programs.git = {
    enable = true;
    userName = "ndelobel";
    userEmail = "nathan.delobel@protonmail.com";
  };

  home.packages = with pkgs; [
    resources
    ghostty
    gh
  ];
}
