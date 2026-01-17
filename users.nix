{ pkgs, ... }:
{
  imports =
    let
      home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
    in
    [ (import "${home-manager}/nixos") ];

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
      pkgs.kdePackages.kate
      pkgs.neovim
      pkgs.nixd
      pkgs.nil
      pkgs.thunderbird
      pkgs.git
      pkgs.vim
      pkgs.rustup
      pkgs.vulkan-tools
      pkgs.clang
    ];
  };
  home-manager.users.asdfer =
    { pkgs, ... }:
    {
      programs.bash.enable = true;
      programs.zed-editor = {
        enable = true;
        extensions = [
          "toml"
          "nix"
        ];
        mutableUserSettings = true;
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

      #       xdg.configFile = {
      #         "asdf/ew" = {
      #           text = "hello";
      #         };
      #       };

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
