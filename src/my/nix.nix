{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
{
  options.my.nix.setup = mkEnableOption "";
  config = mkIf config.my.nix.setup {
    system.stateVersion = "25.11";
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
    nixpkgs.config.allowUnfree = true;
    programs.nix-index.enable = true;
    environment.systemPackages = with pkgs; [
      nvfetcher
    ];
  };
}
