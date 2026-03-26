# Home manager modules
{ myLib, ... }:
with myLib;
{
  imports = mkImports [
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
    ./tetrio
    ./atril
    ./alacritty
    ./libreoffice
  ];
}
