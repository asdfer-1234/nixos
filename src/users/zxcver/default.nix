{ myLib, ... }:
with myLib;
{
  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
  home-manager.users.zxcver = nixPath ./home.nix;
}
