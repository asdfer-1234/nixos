{ lib, pkgs, ... }:
with lib;
{
  options = {
    myModule.uni.webPython.enable = mkEnableOption "";
  };
  config = mkIf myModule.uni.webPython.enable {
    home.packages = with pkgs; [
      python3
      conda
    ];
  };
}
