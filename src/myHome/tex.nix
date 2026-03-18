{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    myModules.tex.enable = mkEnableOption "";
  };
  config = mkIf config.myModules.tex.enable {
    home.packages = with pkgs; [
      texliveFull
      texworks
    ];
  };
}
