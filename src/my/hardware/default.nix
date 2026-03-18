{ myLib, ... }:
with myLib;
{
  imports = importGen [
    ./laptop
  ];
}
