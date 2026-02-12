{
  pkgs,
  lib,
  ml,
  kakaotalk,
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

  programs.bash = {
    enable = true;
    bashrcExtra = fileContents ./bashrcExtra.bash;
  };
  programs.lutris.enable = true;
  programs.obs-studio.enable = true;
  programs.neovim.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
  home.packages = with pkgs; [
    # Stuff
    thunderbird
    alacritty
    fuzzel
    xfce.thunar
    kdePackages.dolphin
    mate.atril
    kakaotalk.packages.${pkgs.system}.kakaotalk
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

  services.polkit-gnome.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.11";
}
