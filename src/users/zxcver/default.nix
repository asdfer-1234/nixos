{ myLib, ... }:
with myLib;
{
  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
  };
  home-manager.users.zxcver = nixPath ./home;
}
