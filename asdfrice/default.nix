{
  config,
  lib,
  qsrs,
  pkgs,
  ...
}:
let
  cfg = config.rice.asdfrice;
in
{

  imports = [
    ../myModules/kanata.nix
    ../myModules/niri.nix
    ../myModules/quickshell.nix
  ];
  options.rice.asdfrice = {
    enable = lib.mkEnableOption "yay!";
  };

  config = lib.mkIf cfg.enable {
    myModules.kanata = {
      enable = true;
      cmd = true;
      config = lib.readFile ./kanata.kbd;
    };
    myModules.niri = {
      enable = true;
      config = lib.readFile ./niri.kdl;
    };
    myModules.quickshell = {
      enable = true;
      configDirectory = ./quickshell;
      extraPackages = [
        qsrs.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
    xdg.autostart.enable = true;
    home.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
