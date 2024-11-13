{pkgs, ...}: {
  imports = [./browser.nix ./dev.nix ./gaming.nix];

  home.packages = with pkgs; [
    nautilus
    gnome-console
    resources
  ];
}
