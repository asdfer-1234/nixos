{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/db {
  services.mysql = {
    enable = true;
    package = pkgs.mariadb_114;
  };
  environment.systemPackages = [ pkgs.mycli ];
}
