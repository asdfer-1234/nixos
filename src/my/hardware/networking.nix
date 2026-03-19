{
  lib,
  myLib,
  config,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/hardware/networking {
  networking.networkmanager.enable = true;
  boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";
}
