{
  inputs,
  qsrs,
  myLib,
  pkgs,
  kakaotalk,
  ...
}:
{
  services.displayManager.cosmic-greeter.enable = true;

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
