{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
{
  options.my.users.asdfer.enable = mkEnableOption "";
  config = mkIf config.my.users.asdfer.enable {
    users.users.asdfer = {
      isNormalUser = true;
      description = "the main user with sudo privileges";
      extraGroups = [
        "networkmanager"
        "wheel"
        "uinput"
        "input"
      ];
    };
    home-manager.users.asdfer = nixPath ./home;
    my.home-manager.enable = true;

    programs.niri.enable = true; # is this really needed?
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      extraPackages = with pkgs; [ protonup-qt ];
    };
    services.logmein-hamachi.enable = true;
  };
}
