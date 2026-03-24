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
      PermitRootLogin = "no";
      AllowUsers = [ "access" ];
      GatewayPorts = "yes";
    };
  };

  users.users.access = {
    isNormalUser = true;
    description = "the main user with sudo privileges";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM88TBQcNoOEGSnx7CoGnrt/BGFVXdiJjLaMRZxuqFXB asdfer"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2p/d5bq0GCaLdgkxUG3rFVM4S6jddQDGdxX9XPZw00CQzbMAKpX9vRdyFeE8PMVxzrGROsIgZQTN2PQTcifJLNdWfz9gLnB6zNsljZXSrgINF8OZ0HhWxbbV0vrfnugcYiBo+8AIur/pbgcMJ6JaP8y6SgNjn1dQqmQsDyJDZF8KDsnUqUZD6gSd9tzw0ZNMAgnp2YQ2WfrHuEUnKLUlNfniRda4GuT9OQlB8ngah6wfuAXcHvOmwK7QhsAJhw6j00w2mlI1bV5m1qCR40TJoLYjsoCAvm4HIoetXXZpcCjcai4D2XwSDlheibr9dMY1ojGatFbp3ZH1BtpFQXN8n a"
    ];
  };
}
