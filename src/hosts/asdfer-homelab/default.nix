{
  pkgs,
  myLib,
  ...
}:
with myLib;
{
  imports = importGen [
    ./hardware
    ../../my
  ];
  my.nix.setup = true;

  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Seoul";
  networking.hostName = "asdfer-homelab";
  my.hardware.networking.enable = true;
  my.hardware.audio.enable = true;
  my.hardware.power.enable = true;
  my.hardware.input.enable = true;
  security.rtkit.enable = true;

  my.core.enable = true;
}
