{
  pkgs,
  myLib,
  ...
}:
with myLib;
{
  imports = importGen [
    ../../users
    ../../my
    ./hardware
  ];
  my.nix.setup = true;
  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Seoul";
  networking.hostName = "asdfer-laptop";
  my.hardware.networking.enable = true;
  my.hardware.bluetooth.enable = true;
  my.hardware.audio.enable = true;
  my.hardware.power.enable = true;
  my.hardware.input.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;
  my.graphicalUtils.enable = true;

  my.core.enable = true;
  my.ime.enable = true;
  my.fonts.enable = true;

  my.users = {
    asdfer.enable = true;
    zxcver.enable = true;
  };
}
