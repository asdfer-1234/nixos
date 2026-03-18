{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
{
  imports = importGen [
    ./webPython
  ];

  options = {
    my.uni.enable = mkEnableOption "";
  };

  config = mkIf config.my.uni.enable {
    my.uni.webPython.enable = true;
  };
}
