{ myLib, ... }:
with myLib;
{
  imports = importGen [
    ./fonts
    ./ime
    ./bash
    ./fetches
    ./funzies
    ./core
    ./nix
    ./hardware
    ./home-manager
    ./graphicalUtils
    ./steam
  ];
}
