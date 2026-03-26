{ myLib, ... }:
with myLib;
{
  imports = mkImports [
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
    ./homelab
    ./db
  ];
}
