{
  myLib,
  ...
}:
with myLib;
{
  imports = importGen [
    ./asdfer
    ./zxcver
  ];

}
