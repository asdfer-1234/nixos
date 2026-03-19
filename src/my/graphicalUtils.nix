{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/graphicalUtils {
  environment.systemPackages = with pkgs; [
    nvtopPackages.full
    vulkan-tools
  ];
}
