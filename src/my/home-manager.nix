{
  myLib,
  config,
  hmInputs,
  ...
}:
with myLib;
mkEnableModule config /my/home-manager {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs

        myLib
        ;
      inherit (hmInputs)
        qsrs
        kakaotalk
        ;
    };
  };
}
