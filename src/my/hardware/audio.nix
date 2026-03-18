{ config, lib, ... }:
with lib;
{
  options.my.hardware.audio.enable = mkEnableOption "";
  config = mkIf config.my.hardware.audio.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
