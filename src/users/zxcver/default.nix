{
  config,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
{
  options.my.users.zxcver.enable = mkEnableOption "";
  config = mkIf config.my.users.zxcver.enable {
    users.users.zxcver = {
      isNormalUser = true;
      description = "other user without sudo";
      extraGroups = [ "networkmanager" ];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2p/d5bq0GCaLdgkxUG3rFVM4S6jddQDGdxX9XPZw00CQzbMAKpX9vRdyFeE8PMVxzrGROsIgZQTN2PQTcifJLNdWfz9gLnB6zNsljZXSrgINF8OZ0HhWxbbV0vrfnugcYiBo+8AIur/pbgcMJ6JaP8y6SgNjn1dQqmQsDyJDZF8KDsnUqUZD6gSd9tzw0ZNMAgnp2YQ2WfrHuEUnKLUlNfniRda4GuT9OQlB8ngah6wfuAXcHvOmwK7QhsAJhw6j00w2mlI1bV5m1qCR40TJoLYjsoCAvm4HIoetXXZpcCjcai4D2XwSDlheibr9dMY1ojGatFbp3ZH1BtpFQXN8n a"
      ];
    };
    home-manager.users.zxcver = nixPath ./home;
    my.home-manager.enable = true;

    services.openssh = {
      enable = true;
      ports = [ 1234 ];
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "zxcver" ];
      };
    };
  };
}
