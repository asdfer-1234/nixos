{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/uni {
  imports = mkImports [
    ./webPython
  ];

  my.uni.webPython.enable = true;
}
