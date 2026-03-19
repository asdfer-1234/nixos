{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/homelab {
  services.vaultwarden = {
    enable = true;

    config = {
      DOMAIN = "https://localhost";
    };
  };
}
