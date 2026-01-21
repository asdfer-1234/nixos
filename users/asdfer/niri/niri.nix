{ config, lib, ... }:
let
  cfg = config.programs.niri;
in
{
  options.programs.niri = {
    enable = lib.mkEnableOption "the best wayland compositor ever i dont take objections";
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/" = {
        source = ./dotfile;
        force = true;
      };
    };
  };
}
