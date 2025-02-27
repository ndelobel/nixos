{ pkgs, ... }: {
  imports = [ ./gaming.nix ];

  environment.systemPackages = with pkgs; [
    git
  ];

  programs.firefox.enable = true;
}
