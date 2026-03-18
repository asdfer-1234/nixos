{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
{
  options.my.hardware.power.enable = mkEnableOption "";
  config = mkIf config.my.hardware.power.enable {
    services.upower.enable = true;
    environment.systemPackages = with pkgs; [
      acpi
    ];
  };
}
