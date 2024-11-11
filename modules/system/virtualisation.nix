{...}: {
  virtualisation = {
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };

    docker.enable = true;
  };

  users.users.ndelobel.extraGroups = ["vboxusers" "docker"];
}
