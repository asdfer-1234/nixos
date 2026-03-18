{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
{
  options.my.funzies.enable = mkEnableOption "";
  config = mkIf config.my.funzies.enable {
    environment.systemPackages = with pkgs; [
      cbonsai
      cowsay
      sl
    ];
  };
}
