{
  myLib,
  lib,
  config,
  hmInputs,
  ...
}:
with lib;
{
  options.my.home-manager.enable = mkEnableOption "";
  config = mkIf config.my.home-manager.enable {
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
  };
}
