{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.myModules.niri;
in
{
  options.myModules.niri = {
    enable = lib.mkEnableOption "niri!";
    config = lib.mkOption { type = lib.types.str; };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/config.kdl" = {
        text = cfg.config;
        force = true;
      };
    };
    home.packages = with pkgs; [
      niri
      xwayland-satellite
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
      wlr-protocols
    ];
  };
}
