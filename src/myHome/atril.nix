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
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "atril.desktop";
  };
}
