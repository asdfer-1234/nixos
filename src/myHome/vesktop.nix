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
          enabled = true;
          sidebar = true;
          sidebarAnim = true;
          closeAllFolders = true;
          closeOthers = true;
          forceOpen = true;
          showFolderIcon = 0;
        };
        MessageLogger = {
          enabled = true;
          ignoreSelf = true;
        };
        TypingTweaks.enabled = true;
        DontRoundMyTimestamps.enabled = true;
        FriendsSince.enabled = true;
        iLoveSpam.enabled = true;
        NoF1.enabledenabled = true;
        WhoReacted.enabled = true;
        GreetStickerPicker.enabled = true;
        ShowMeYourName.enabled = true;
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
