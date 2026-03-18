{ myLib, ... }:
{
  imports = myLib.importGen [
    ./fonts
    ./ime
    ./bash
    ./fetches
  ];
}
