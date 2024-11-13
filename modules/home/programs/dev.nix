{pkgs, ...}: {
  home.packages = with pkgs; [
    # nix
    nixd
    alejandra

    jetbrains.clion
    gcc
    cmake

    # web
    insomnia
    jetbrains.webstorm

    # rust
    jetbrains.rust-rover
    rustup
  ];

  programs.git = {
    enable = true;
    userName = "ndelobel";
    userEmail = "nathan.delobel@protonmail.com";
  };
}