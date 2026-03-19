{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/tex {
  home.packages = with pkgs; [
    texliveFull
    texworks
  ];
}
