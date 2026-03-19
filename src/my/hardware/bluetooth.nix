{ config, myLib, ... }:
with myLib;
mkEnableModule config /my/hardware/blueotooth {
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
