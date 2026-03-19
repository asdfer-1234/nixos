{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
mkEnableModule {
  options.my.hardware.bluetooth.enable = mkEnableOption "";
  config = mkIf config.my.hardware.bluetooth.enable {
    hardware.bluetooth.enable = true;
    services.blueman.enable = true;
  };
}
