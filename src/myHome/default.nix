# Home manager modules
{ myLib, ... }:
{
  imports = myLib.importGen [
    ./kanata
    ./niri
    ./quickshell
    ./vesktop
    ./tex
  ];
}
