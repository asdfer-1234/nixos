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
    ./bluetooth
    ./nix
    ./hardware
    ./home-manager.nix
  ];
}
