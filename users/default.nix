{ ... }:
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

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
