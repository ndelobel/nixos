{...}: {
  imports = [./programs ./gnome.nix ./theme.nix];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "ndelobel";
    homeDirectory = "/home/ndelobel";

    stateVersion = "24.05";
  };
}
