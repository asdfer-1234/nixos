{
  inputs,
  myLib,
  lib,
  config,
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
        inherit (inputs.hmInputs)
          qsrs
          kakaotalk
          ;
      };
    };
  };
}
