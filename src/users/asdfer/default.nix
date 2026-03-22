{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/users/asdfer {
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
  my.steam.enable = true;
  services.logmein-hamachi.enable = true;

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "asdfer" ];
}
