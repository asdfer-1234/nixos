{
  config,
  lib,
  pkgs,
}:
with lib;
{
  options.my.hardware.input.enable = mkEnableOption "";
  config = mkIf config.my.hardware.input.enable {
    hardware.uinput.enable = true;
    hardware.keyboard.zsa.enable = true;
    environment.systemPackages = with pkgs; [ evhz ];
  };
}
