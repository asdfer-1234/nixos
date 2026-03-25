{
  myLib,
  config,
  pkgs-stable,
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
        pkgs-stable
        myLib
        ;
      inherit (hmInputs)
        qsrs
        kakaotalk
        ;
    };
  };
}
