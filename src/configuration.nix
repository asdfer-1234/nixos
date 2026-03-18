{
  pkgs,
  myLib,
  ...
}:
with myLib;
{
  imports = importGen [
    ./users
    ./git
    ./my
  ];

  system.stateVersion = "25.11";
  my.nix.setup = true;

  my.hardware.laptop.enable = true;
  # Bootloader.

  boot.kernelPackages = pkgs.linuxPackages;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Asia/Seoul";
  networking.hostName = "asdfer-laptop"; # Define your hostname.
  my.hardware.networking.enable = true;
  my.hardware.bluetooth.enable = true;
  my.hardware.audio.enable = true;
  my.hardware.power.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;

  my.core.enable = true;
  my.ime.enable = true;
  my.fonts.enable = true;
}
