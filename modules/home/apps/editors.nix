{pkgs, ...}: {
  home.packages = with pkgs; [
    jetbrains.webstorm
    jetbrains.rust-rover
    jetbrains.pycharm-professional
    jetbrains.clion
  ];
}
