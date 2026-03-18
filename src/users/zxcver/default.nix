{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
{
  options.my.users.zxcver.enable = mkEnableOption "";
  config = mkIf config.my.users.zxcver.enable {
    users.users.zxcver = {
      isNormalUser = true;
      description = "other user without sudo";
      extraGroups = [ "networkmanager" ];
    };
    home-manager.users.zxcver = nixPath ./home;
    my.home-manager.enable = true;
  };
}
