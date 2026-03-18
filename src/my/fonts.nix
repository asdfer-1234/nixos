{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.my.fonts.enable = mkEnableOption "";
  config = mkIf config.my.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      maple-mono.truetype
      fira
      cascadia-code
      source-code-pro
      input-fonts
      nanum
      nanum-gothic-coding
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      terminus_font
    ];
    nixpkgs.config.input-fonts.acceptLicense = true;
  };
}
