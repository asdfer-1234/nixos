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
        "wat"
      ];
      # mutableUserSettings = false;
      userSettings = {
        theme = "Ayu Light";
        title_bar = {
          show_sign_in = false;
        };
        lsp.rust-analyzer.binary.path_lookup = true;
        lsp.wasm-language-tools.path_lookup = true;
      };
      extraPackages = with pkgs; [
        nixd
        nil
        clang
        kdePackages.qtdeclarative
        wasm-language-tools
      ];
    };

    home.sessionVariables = mkIf config.my.zed.default {
      EDITOR = "zeditor";
    };
  };
}
