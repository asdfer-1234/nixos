{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/homelab {
# The service
    services.vaultwarden = {
      dbBackend = "sqlite";
      config = {
        ROCKET_ADDRESS = "127.0.0.1";
        ROCKET_PORT = 8222;
        DOMAIN = "https://localhost";
        SIGNUPS_ALLOWED = true;
        ADMIN_TOKEN = "$argon2id$v=19$m=65540,t=3,p=4$...";
        LOG_FILE = "/var/lib/bitwarden_rs/access.log";
      };
    };

    # The CLI tool
    environment.systemPackages = [
      pkgs.vaultwarden
    ];

    # The nginx reverse proxy
    services.nginx = let vault-host = "localhost"; in {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts."${vault-host}" = {
        forceSSL = true;
        enableACME = true;
        extraConfig = ''
          access_log /var/log/nginx/${vault-host}.access.log;
          error_log /var/log/nginx/${vault-host}.error.log;
        '';
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

}
