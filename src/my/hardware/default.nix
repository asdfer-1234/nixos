{ myLib, ... }:
with myLib;
{
  imports = importGen [
    ./laptop
    ./networking
    ./bluetooth
    ./audio
    ./power
    ./input
  ];
}
