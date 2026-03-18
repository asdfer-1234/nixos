{ lib, pkgs, ... }:
with lib;
{
  options = {
    enable = mkEnableOption "";
  };
  home.packages = with pkgs; [
    python3
    conda
  ];
}
