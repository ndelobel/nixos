{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "ndelobel";
    userEmail = "nathan.delobel@protonmail.com";
  };

  home.packages = with pkgs; [
    git-lfs
    gh
  ];
}
