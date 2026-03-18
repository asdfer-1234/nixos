{ myLib, ... }:
{
  imports = myLib.importGen [
    ./webPython
  ];

  config = {
    myModules.uni.webPython.enable = true;
  };
}
