{
  inputs,
  qsrs,
  myLib,
  kakaotalk,
  ...
}:
{
  services.displayManager.cosmic-greeter.enable = true;
  imports = [
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
