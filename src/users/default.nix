{
  myLib,
  ...
}:
with myLib;
{
  imports = mkImports [
    ./asdfer
    ./zxcver
  ];

}
