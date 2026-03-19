{ config, myLib, ... }:
with myLib;
mkEnableModule config /my/hardware/bluetooth {
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
