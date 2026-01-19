{
  config,
  pkgs,
  configDirectory,
  ...
}:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${configDirectory}${path}";
in
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
      "qml"
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
    pkgs.xwayland-satellite
    pkgs.kdePackages.qtdeclarative
    pkgs.quickshell
  ];
  home.sessionVariables = {
    EDITOR = "zeditor";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  xdg.configFile = {
    "niri/" = {
      source = link "users/asdfer/niri";
      force = true;
    };
    "quickshell/" = {
      source = link "users/asdfer/quickshell";
      force = true;
    };
    "zed/settings.json" = {
      force = true;
    };
  };

  home.stateVersion = "25.11";
}
