{
  config,
  lib,
  myLib,
  ...
}:
with lib;
{
  imports = myLib.importGen [
    ./webPython
  ];

  options = {
    myModules.uni.enable = mkEnableOption "";
  };

  config = mkIf config.myModules.uni.enable {
    myModules.uni.webPython.enable = true;
  };
}
