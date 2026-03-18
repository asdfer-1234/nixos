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
  my.users = {
    asdfer.enable = true;
    zxcver.enable = true;
  };
}
