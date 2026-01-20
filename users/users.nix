{
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
      default = [ "gnome" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };

  programs.steam.enable = true;

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
