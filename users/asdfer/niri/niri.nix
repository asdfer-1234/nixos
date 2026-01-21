{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.rice.niri;
in
{

  imports = [ ./kanata/kanata.nix ];
  options.rice.niri = {
    enable = lib.mkEnableOption "the best wayland compositor ever i dont take objections";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/" = {
        source = ./dotfile;
        force = true;
      };
    };
    home.packages = [
      pkgs.niri
      pkgs.kanata
      pkgs.quickshell
    ];
  };
}
