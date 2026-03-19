# Home manager modules
{ myLib, ... }:
with myLib;
{
  imports = importGen [
    ./kanata
    ./niri
    ./quickshell
    ./vesktop
    ./tex
    ./firefox
    ./uni
    ./zed
    ./asdfrice
    ./graphicalEditing
    ./kakaotalk
  ];
}
