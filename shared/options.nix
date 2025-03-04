{
  lib,
  ...
}:
{
  options.custom = {
    gaming.enable = lib.mkEnableOption "Enable gaming-related configurations";
  };
}
