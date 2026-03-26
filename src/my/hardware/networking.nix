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
    ensureProfiles.profiles =
      let
        mkSimpleProfile =
          {
            ssid,
            id ? ssid,
            pw,
          }:
          {
            connection = {
              id = ssid;
              interface-name = "wlp46s0";
              type = "wifi";
            };
            wifi = {
              inherit ssid;
            };
            wifi-security = {
              auth-alg = "open";
              key-mgmt = "wpa-psk";
              psk = pw;
            };
          };
      in
      {
        asdfer-hotspot = mkSimpleProfile {
          ssid = "asdfer-hotspot";
          pw = "asdfasdfasdf";
        };
      };
  };
}
