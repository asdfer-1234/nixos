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

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        qsrs
        myLib
        kakaotalk
        ;
    };
  };
}
