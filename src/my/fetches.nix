{
  lib,
  myLib,
  pkgs,
  config,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/fetches {
  environment.systemPackages = with pkgs; [
    cpufetch
    fastfetch
    ramfetch
  ];
}
