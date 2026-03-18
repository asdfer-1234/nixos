{ myLib, ... }:
{
  imports = myLib.importGen [
    ./laptop
  ];
}
