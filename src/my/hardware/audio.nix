{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/hardware/audio {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
