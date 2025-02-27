{ ... } : {
  imports = [ ./gaming.nix ];

  environment.systemPackages = with pkgs; [

  ];

  programs.firefox.enable = true;
}
