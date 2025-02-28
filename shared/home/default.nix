{ inputs, ... }: {
  imports = [
    ./apps/default.nix
    ./theme.nix
    ./gnome.nix
    ./fonts.nix
  ];

  home.username = "ndelobel";
  home.homeDirectory = "/home/ndelobel";

  nixpkgs = {
    overlays = [ inputs.nur.overlays.default ];
    config = {
      allowUnfree = true;
    };
  };

  home.stateVersion = "24.11";
}
