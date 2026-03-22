{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/tetrio {
  home.packages = with pkgs; [ tetrio-desktop ];
}
