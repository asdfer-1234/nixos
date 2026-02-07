{ lib, ... }:
with lib;
{
  programs.firefox = {
    enable = true;
    preferences = {
      "browser.urlbar.suggest.history" = false;
      "privacy.clearHistory.formdata" = true;
      "privacy.clearHistory.browsingHistoryAndDownloads" = true;
      "privacy.clearHistory.siteSettings" = true;
    };

    policies = {
      DisableTelemetry = true;
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;
      # Extensions
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*".installation_mode = "blocked";

          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
    };
  };
}
