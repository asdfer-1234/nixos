{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/uni {
  imports = importGen [
    ./webPython
  ];

  my.uni.webPython.enable = true;
}
