{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
{
  options.my.ime.enable = mkEnableOption "";
  config = mkIf config.my.ime.enable {
    # Locale
    i18n = {
      defaultLocale = "en_US.UTF-8";
      inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
          fcitx5-gtk
          fcitx5-hangul
          fcitx5
        ];
      };
    };
  };
}
