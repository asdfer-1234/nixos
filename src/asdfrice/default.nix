{
  config,
  lib,
  qsrs,
  pkgs,
  myLib,
  ...
}:
let
  cfg = config.rice.asdfrice;
in
{

  imports = myLib.importGen [
  ];
  options.rice.asdfrice = {
    enable = lib.mkEnableOption "yay!";
  };

  config = lib.mkIf cfg.enable {
    my.kanata = {
      enable = true;
      cmd = true;
      config = lib.readFile ./kanata.kbd;
    };
    my.niri = {
      enable = true;
      config = lib.readFile ./niri.kdl;
    };
    my.quickshell = {
      enable = true;
      configDirectory = ./quickshell;
      extraPackages = [
        qsrs.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
    xdg.autostart.enable = true;
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    home.packages = with pkgs; [
      swaybg
      wl-clipboard
    ];
  };
}
