{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/uni/webPython {
  home.packages = with pkgs; [
    python3
    conda
  ];
}
