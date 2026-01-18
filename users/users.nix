{
  pkgs,
  inputs,
  ...
}:
{

  users.users.asdfer = {
    isNormalUser = true;
    description = "the main user with sudo privileges";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.niri.enable = true;
  xdg.portal.enable = true;
  xdg.portal.config = {
    common = {
      default = [ "kde" ];
    };
  };

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
