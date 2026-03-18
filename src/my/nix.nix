{ config, lib, ... }:
with lib;
{
  options.my.nix.setup = mkEnableOption "";
  config = mkIf config.my.nix.setup {
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      settings = {
        keep-outputs = true;
        keep-derivations = true;
      };
    };
  };
}
