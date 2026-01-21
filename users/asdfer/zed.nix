{ pkgs, ... }:
{
  xdg.configFile = {
    "zed/settings.json" = {
      force = true;
    };
  };
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
      theme = "Ayu Light";
      title_bar = {
        show_sign_in = false;
      };
      lsp.rust-analyzer.binary.path_lookup = true;
    };
    extraPackages = [
      pkgs.nixd
      pkgs.nil
      pkgs.rustup
      pkgs.clang
      pkgs.kdePackages.qtdeclarative
    ];
  };

  home.sessionVariables = {
    EDITOR = "zeditor";
  };
}
