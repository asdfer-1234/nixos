{ config, lib, ... }:
with lib;
{
  options.my.bluetooth.enable = mkEnableOption "";
  config = mkIf config.my.bluetooth.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
