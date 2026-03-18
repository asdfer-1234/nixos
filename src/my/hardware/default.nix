{ myLib, ... }:
with myLib;
{
  imports = importGen [
    ./networking
    ./bluetooth
    ./audio
    ./power
    ./input
  ];
}
