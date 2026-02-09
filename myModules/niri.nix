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
    home.packages = with pkgs; [
      niri
      xwayland-satellite
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gnome
      wlr-protocols
    ];

    xdg.configFile = {
      "niri/config.kdl" = {
        text = cfg.config;
        force = true;
      };
    };

    xdg.portal = {
      enable = true;
      config = {
        common = {
          default = [ "gnome" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
        kdePackages.polkit-kde-agent-1
      ];
    };
  };
}
