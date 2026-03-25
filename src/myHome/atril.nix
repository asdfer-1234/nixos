{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule {
  home.packages = with pkgs; [
    atril
  ];
  xdg.mime.defaultApplications = {
    "application/pdf" = "atril.desktop";
  };
}
