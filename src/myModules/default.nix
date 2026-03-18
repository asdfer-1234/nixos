{ myLib, ... }:
{
  imports = myLib.importGen [
    ./kanata
    ./niri
    ./quickshell
    ./vesktop
  ];
}
