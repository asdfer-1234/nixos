{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableOption config /my/tex {
  home.packages = with pkgs; [
    texliveFull
    texworks
  ];
}
