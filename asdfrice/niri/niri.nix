{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.asdfRice.niri;
in
{
  imports = [ .././kanata/kanata.nix ];
  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "niri/" = {
        source = ./dotfile;
        force = true;
      };
    };
    home.packages = [
      pkgs.niri
      pkgs.quickshell
    ];
  };
}
