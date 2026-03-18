{
  inputs,
  qsrs,
  myLib,
  kakaotalk,
  ...
}:
with myLib;
{
  services.displayManager.cosmic-greeter.enable = true;
  imports = importGen [
    ./asdfer
    ./zxcver
  ];
  my.users = {
    asdfer.enable = true;
    zxcver.enable = true;
  };
}
