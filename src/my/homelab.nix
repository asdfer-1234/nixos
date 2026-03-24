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

  services.openssh = {
    enable = true;
    ports = [ 1234 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "false";
      AllowUsers = [ "asdfer" ];
    };
  };

  users.users.access = {
    isNormalUser = true;
    description = "the main user with sudo privileges";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ssh.authorizedKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM88TBQcNoOEGSnx7CoGnrt/BGFVXdiJjLaMRZxuqFXB asdfer@asdfer-laptop"
    ];
  };
}
