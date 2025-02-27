{ ... }: {
  users.users.ndelobel = {
    isNormalUser = true;
    description = "Nathan Delobel";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
