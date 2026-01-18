{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  users.users.asdfer = {
    isNormalUser = true;
    description = "the main user with sudo privileges";

    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = [
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
  };

  programs.niri.enable = true;
  xdg.portal.config.niri = {
    "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
  };

  home-manager.users.asdfer =
    {
      pkgs,
      lib,
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
        ZED_ALLOW_EMULATED_GPU = 1;
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
    };

  users.users.zxcver = {
    isNormalUser = true;
    description = "other user without sudo";
    extraGroups = [ "networkmanager" ];
    packages = [
    ];
  };
}
