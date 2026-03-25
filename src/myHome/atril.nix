{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/atril {
  home.packages = with pkgs; [
    atril
  ];
  xdg.mime.defaultApplications = {
    "application/pdf" = "atril.desktop";
  };
}
