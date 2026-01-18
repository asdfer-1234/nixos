{
  config,
  ...
}:
{
  programs.bash.enable = true;
  programs.zed-editor = {
    enable = true;
    extensions = [
      "toml"
      "nix"
      "kdl"
    ];
    mutableUserSettings = false;
    userSettings = {
      vim_mode = true;
      theme = "Ayu Light";
      title_bar = {
        show_sign_in = false;
      };
    };
  };
  home.sessionVariables = {
    EDITOR = "zeditor";
  };

  xdg.configFile = {
    "niri/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink ./config.kdl;
    };
    "zed/settings.json" = {
      force = true;
    };
  };

  home.stateVersion = "25.11";
}
