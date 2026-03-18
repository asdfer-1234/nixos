{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.my.core.enable = mkEnableOption "";
  config = mkIf config.my.core.enable {
    environment.systemPackages = with pkgs; [
      tldr
      killall
      ranger
      ripgrep
      p7zip
      trashy
      tree
      yt-dlp
    ];
  };
  my.bash.enable = true;
  my.fetches.enable = true;
  my.funzies.enable = true;
}
