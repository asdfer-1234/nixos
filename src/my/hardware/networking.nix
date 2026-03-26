{
  lib,
  myLib,
  config,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/hardware/networking {
  boot.extraModprobeConfig = "options iwlwifi 11n_disable=8\n";
  networking.networkmanager = {
    enable = true;
    ensureProfiles.profiles = config.secret.connections;
  };
}
