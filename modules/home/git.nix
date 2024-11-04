{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "ndelobel";
    userEmail = "nathan.delobel@protonmail.com";
    extraConfig = {
      credential.helper = "!gh auth git-credential";
    };
  };

  home.packages = with pkgs; [
    git-lfs
    gh
  ];
}
