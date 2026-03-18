{ myLib, ... }:
{
  imports = myLib.importGen [
    ./fonts
    ./ime
    ./bash
    ./fetches
    ./funzies
    ./core
    ./bluetooth
    ./nix
    ./hardware
  ];
}
