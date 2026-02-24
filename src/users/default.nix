{ pkgs, kakaotalk, ... }:
{
  services.displayManager.cosmic-greeter.enable = true;

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

  # TODO: move below config into home-manager somehow
  programs.niri.enable = true;
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  environment.systemPackages = [
    kakaotalk.packages.${pkgs.system}.kakaotalk
  ];

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
