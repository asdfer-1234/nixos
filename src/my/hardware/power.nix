{
  myLib,
  config,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/hardware/power {
  services.upower.enable = true;
  environment.systemPackages = with pkgs; [
    acpi
  ];
}
