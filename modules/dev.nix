{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # editors
    jetbrains.rust-rover
    jetbrains.pycharm-professional
    jetbrains.clion
    vscode

    # rust
    rustup
    rust-analyzer

    # python
    python313

    # nix
    nixd
    alejandra

    # c
    gcc
    clang
    cmake

    # git
    git
    git-lfs
    gh

    docker-compose

    insomnia
  ];

  home-manager.users.ndelobel = {
    programs = {
      # rust
      bash.initExtra = ''
        if ! rustup toolchain list | grep -q stable; then
            rustup install stable
            rustup default stable
            rustup component add rustfmt clippy
        fi
      '';

      # git
      git = {
        enable = true;
        userName = "ndelobel";
        userEmail = "nathan.delobel@protonmail.com";
        extraConfig = {
          credential.helper = "!gh auth git-credential";
        };
      };
    };
  };

  # nix config
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

  # docker
  virtualisation.docker.enable = true;
  users.users.ndelobel.extraGroups = [ "docker" ];
}
