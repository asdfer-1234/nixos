{ pkgs, lib, ... }:
with lib;
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";

        engines = import ./engines.nix { inherit pkgs; };
      };
    };

    policies = {
      DisableTelemetry = true;
      AppAutoUpdate = false;
      DontCheckDefaultBrowser = true;
      GenerativeAI.Enabled = false;
      DisableFirefoxAccounts = true;

      # Extensions
      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*".installation_mode = "allowed";

          # uBlock Origin
          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };

          # Bitwarden Password Manager
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = moz "{446900e4-71c2-419f-a6a7-df9c091e268b}";
            installation_mode = "force_installed";
            updates_disabled = true;
          };

          # User-Agent Switcher
          "user-agent-switcher@ninetailed.ninja" = {
            install_url = moz "user-agent-switcher@ninetailed.ninja";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
      # Extension configuration
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = rec {
            cloudStorageEnabled = mkForce false;

            importedLists = [
              "https:#filters.adtidy.org/extension/ublock/filters/3.txt"
              "https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            ];

            externalLists = lib.concatStringsSep "\n" importedLists;
          };

          selectedFilterLists = [
            "CZE-0"
            "adguard-generic"
            "adguard-annoyance"
            "adguard-social"
            "adguard-spyware-url"
            "easylist"
            "easyprivacy"
            "https:#github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
            "plowe-0"
            "ublock-abuse"
            "ublock-badware"
            "ublock-filters"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "urlhaus-1"
          ];
        };
      };

      Preferences = {
        "browser.aboutConfig.showWarning" = false;
        "browser.urlbar.trimURLs" = false;
        "general.autoScroll" = true;
      };
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
