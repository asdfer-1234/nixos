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
  };
  xdg.configFile = {
    "vesktop/state.json" = {
      text = toJSON {
        firstLaunch = false;
      };
    };
  };
}
