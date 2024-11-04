{ ... }:
{
  users.users.ndelobel = {
    isNormalUser = true;
    initialPassword = "password";
    description = "Nathan Delobel";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
