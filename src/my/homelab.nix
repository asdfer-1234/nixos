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
    enable = true;
    config = {
      DOMAIN = "https://localhost";
      SIGNUPS_ALLOWED = true;
    };
  };

  # The CLI tool
  environment.systemPackages = [
    pkgs.vaultwarden
  ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  my.db.enable = true;
}
