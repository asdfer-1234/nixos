{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    my.uni.webPython.enable = mkEnableOption "";
  };
  config = mkIf config.my.uni.webPython.enable {
    home.packages = with pkgs; [
      python3
      conda
    ];
  };
}
