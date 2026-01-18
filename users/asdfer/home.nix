{ config, pkgs, ... }:
{
  programs.bash.enable = true;
  programs.lutris.enable = true;
  programs.firefox.enable = true;
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
  home.packages = [
    pkgs.neovim
    pkgs.nixd
    pkgs.nil
    pkgs.thunderbird
    pkgs.git
    pkgs.vim
    pkgs.rustup
    pkgs.vulkan-tools
    pkgs.clang
    pkgs.alacritty
    pkgs.fuzzel
  ];
  home.sessionVariables = {
    EDITOR = "zeditor";
  };

  xdg.configFile = {
    "niri/config.kdl" = {
      source = config.lib.file.mkOutOfStoreSymlink ./niri/config.kdl;
    };
    "zed/settings.json" = {
      force = true;
    };
  };

  home.stateVersion = "25.11";
}
