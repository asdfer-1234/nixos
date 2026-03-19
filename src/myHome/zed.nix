{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options = {
    my.zed.enable = mkEnableOption "zed";
    my.zed.default = mkOption {
      type = types.bool;
      default = false;
    };
  };
  config = mkIf config.my.zed.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "toml"
        "nix"
        "kdl"
        "qml"
      ];
      # mutableUserSettings = false;
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
        pkgs.clang
        pkgs.kdePackages.qtdeclarative
      ];
    };

    home.sessionVariables = mkIf config.my.zed.default {
      EDITOR = "zeditor";
    };
  };
}
