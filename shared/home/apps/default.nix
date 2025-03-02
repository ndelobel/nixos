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
    extraConfig = {
      credential.helper = "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
    };
  };

  home.packages = with pkgs; [
    resources
    ghostty
  ];
}
