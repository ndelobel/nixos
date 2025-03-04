{
  lib,
  pkgs,
  customConfig,
  ...
}:
{
  imports = [
    ./editor.nix
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

  home.packages =
    with pkgs;
    [
      resources
      ghostty
      vesktop
    ]
    ++ lib.optionals customConfig.gaming.enable [
      steam
      cemu
      suyu
    ];

  xdg.dataFile = {
    "applications/vesktop.desktop" = {
      text = ''
        [Desktop Entry]
        Categories=Network;InstantMessaging;Chat
        Exec=vesktop %U
        GenericName=Internet Messenger
        Icon=discord
        Keywords=discord;vencord;electron;chat
        Name=Vesktop
        StartupWMClass=Vesktop
        Type=Application
        Version=1.4
      '';
    };
    "applications/dev.suyu_emu.suyu.desktop" = {
      text = ''
        [Desktop Entry]
        Version=1.0
        Type=Application
        Name=suyu
        GenericName=Switch Emulator
        Comment=Nintendo Switch video game console emulator
        Icon=yuzu
        TryExec=suyu
        Exec=suyu %f
        Categories=Game;Emulator;Qt;
        MimeType=application/x-nx-nro;application/x-nx-nso;application/x-nx-nsp;application/x-nx-xci;
        Keywords=Nintendo;Switch;
        StartupWMClass=suyu
      '';
    };
  };
}
