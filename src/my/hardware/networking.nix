{ lib, config, ... }:
with lib;
{
  options.my.hardware.networking = mkEnableOption "";
  config = mkIf config.my.hardware.networking {
    networking.networkmanager.enable = true;
    boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";
  };
}
