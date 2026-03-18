{ myLib, ... }:
{
  imports = myLib.importGen [
    ./webPython
  ];
}
