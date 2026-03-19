{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/steam {
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    extraPackages = with pkgs; [ protonup-qt ];
  };
}
