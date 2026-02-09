{
  pkgs,
  lib,
  ml,
  ...
}:
with lib;
{

  imports = ml.importGen [
    ../../asdfrice
    ./zed
    ./firefox
  ];

  rice.asdfrice.enable = true;

  programs.bash.enable = true;
  programs.lutris.enable = true;
  programs.obs-studio.enable = true;
  programs.neovim.enable = true;
  home.packages = with pkgs; [
    # Stuff
    thunderbird
    alacritty
    fuzzel
    thunar
    kdePackages.dolphin
    # Graphical Editing
    inkscape
    aseprite
    gimp
    # deadbeef # BUILD FAILS
    # from nix-env
    cava
    font-manager
    ungoogled-chromium
    discord
    # zsa keyboards
    keymapp
    wally-cli

  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.11";
}
