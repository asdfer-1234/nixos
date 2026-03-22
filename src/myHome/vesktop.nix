{
  lib,
  myLib,
  config,
  ...
}:
with lib;
with myLib;
with builtins;
mkEnableModule config /my/vesktop {
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      minimizeToTray = false;
    };
    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      disableMinSize = true;
      plugins = {
        BetterFolders = {
          enable = true;
          sidebar = true;
          sidebarAnim = true;
          closeAllFolders = true;
          closeOthers = true;
          forceOpen = true;
        };
      };
    };
  };
  xdg.configFile = {
    "vesktop/state.json" = {
      text = toJSON {
        firstLaunch = false;
      };
    };
  };
}
