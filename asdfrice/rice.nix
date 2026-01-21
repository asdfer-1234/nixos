{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.rice.asdfrice;
in
{

  imports = [ ../myModules/kanata.nix ];
  options.rice.asdfrice = {
    enable = lib.mkEnableOption "yay!";
  };

  config = lib.mkIf cfg.enable {
  };
}
