{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  options.my.fetches.enable = mkEnableOption "";
  config = mkIf config.my.fetches.enable {
    environment.systemPackages = with pkgs; [
      cpufetch
      fastfetch
      neofetch
      ramfetch
    ];
  };
}
