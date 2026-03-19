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
      # Vaultwarden recommends running behind a reverse proxy, the configureNginx option can be used for that.
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;

      ROCKET_LOG = "critical";
    };
  };
}
