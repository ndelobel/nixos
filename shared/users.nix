{
  lib,
  config,
  pkgs,
  ...
}:
{
  users.users.ndelobel = {
    isNormalUser = true;
    description = "Nathan Delobel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ] ++ lib.optional config.custom.gaming.enable "gamemode";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
