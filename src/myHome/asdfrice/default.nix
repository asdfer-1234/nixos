{
  config,
  lib,
  myLib,
  qsrs,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/rice/asdfrice {
  my.kanata = {
    enable = true;
    cmd = true;
    config = readFile ./kanata.kbd;
  };
  my.niri = {
    enable = true;
    config = readFile ./niri.kdl;
  };
  my.quickshell = {
    enable = true;
    configDirectory = ./quickshell;
    extraPackages = [
      qsrs.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
  xdg.autostart.enable = true;
  home.sessionVariables.NIXOS_OZONE_WL = "1";
  home.packages = with pkgs; [
    swaybg
    wl-clipboard
  ];
}
