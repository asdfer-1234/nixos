{
  myLib,
  config,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/libreoffice {
  home.packages = with pkgs; [ libreoffice ];
}
