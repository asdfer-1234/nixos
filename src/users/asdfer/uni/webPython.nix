{ lib, pkgs, ... }:
with lib;
{
  options = {
    myModules.uni.webPython.enable = mkEnableOption "";
  };
  config = mkIf config.myModules.uni.webPython.enable {
    home.packages = with pkgs; [
      python3
      conda
    ];
  };
}
