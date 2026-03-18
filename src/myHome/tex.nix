{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    my.tex.enable = mkEnableOption "";
  };
  config = mkIf config.my.tex.enable {
    home.packages = with pkgs; [
      texliveFull
      texworks
    ];
  };
}
