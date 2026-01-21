{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.niri;
in
{
  options.rice.niri = {
    enable = lib.mkEnableOption "the best wayland compositor ever i dont take objections";
  };

  config = lib.mkIf cfg.enable {
    imports = [ ./kanata/kanata.nix ];
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
