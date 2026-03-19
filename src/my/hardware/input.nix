{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/hardware/input {
  hardware.uinput.enable = true;
  hardware.keyboard.zsa.enable = true;
  environment.systemPackages = with pkgs; [ evhz ];
}
