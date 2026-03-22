{
  myLib,
  config,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/ime {
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
    extraLocaleSettings = {
      LC_MEASUREMENT = "en_US.UTF-8";
    };
  };
}
