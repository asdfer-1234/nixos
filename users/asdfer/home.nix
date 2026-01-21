{
  pkgs,
  ...
}:
{

  imports = [
    ./kanata/kanata.nix
    ./niri/niri.nix
  ];

  programs.niri.enable = true;
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
      lsp.rust-analyzer.binary.path_lookup = true;
    };
  };
  programs.obs-studio.enable = true;
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
    pkgs.swaybg
    pkgs.niri
  ];
  home.sessionVariables = {
    EDITOR = "zeditor";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  xdg.configFile = {
    "quickshell/" = {
      source = ./quickshell;
      force = true;
    };
    "zed/settings.json" = {
      force = true;
    };
  };

  home.stateVersion = "25.11";
}
