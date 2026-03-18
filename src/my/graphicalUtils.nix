{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.my.grahicalUtils.enable = mkEnableOption "";
  config = mkIf config.my.graphicalUtils.enable {
    environment.systemPackages = with pkgs; [
      nvtopPackages.full
      vulkan-tools
    ];
  };
}
