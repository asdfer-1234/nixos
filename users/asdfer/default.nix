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

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "gnome" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-wlr
      xdg-desktop-portal-kde
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.11";
}
