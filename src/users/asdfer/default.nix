{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableOption config /my/users/asdfer {
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
}
