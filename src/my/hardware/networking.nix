{ lib, config, ... }:
with lib;
{
  options.my.hardware.networking.enable = mkEnableOption "";
  config = mkIf config.my.hardware.networking.enable {
    networking.networkmanager.enable = true;
    boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";
  };
}
