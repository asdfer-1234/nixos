{ myLib, ... }:
with myLib;
{
  imports = mkImports [
    ./networking
    ./bluetooth
    ./audio
    ./power
    ./input
  ];
}
