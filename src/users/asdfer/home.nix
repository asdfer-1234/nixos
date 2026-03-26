{
  pkgs,
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
{
  imports = importGen [
    ../../myHome
  ];

  my.rice.asdfrice.enable = true;

  my.uni.enable = true;
  my.tex.enable = true;
  my.zed = {
    enable = true;
    default = true;
  };
  my.firefox.enable = true;
  my.atril.enable = true;
  my.graphicalEditing.enable = true;

  programs.lutris.enable = true;
  programs.obs-studio.enable = true;
  programs.neovim.enable = true;
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
  my.alacritty.enable = true;
  my.libreoffice.enable = true;
  my.tetrio.enable = true;
  my.kakaotalk.enable = true;
  home.packages = with pkgs; [
    # Stuff
    fuzzel
    baobab
    code
    dragon-drop
    drawio
    kakoune
    kdePackages.kate
    brightnessctl
    qjackctl
    rhythmbox
    # deadbeef # BUILD FAILS
    # Image viewers
    imv
    swayimg
    # File managers
    thunar
    nautilus
    kdePackages.dolphin
    # from nix-env
    cava
    font-manager
    ungoogled-chromium
    # zsa keyboards
    keymapp
    wally-cli
    git-credential-manager
    # games
    prismlauncher
  ];

  services.polkit-gnome.enable = true;
  programs.git = {
    enable = true;
    settings.user = {
      user.email = "<>";
      user.name = "asdfer";
      push.autosetupremote = true;
      credential.gitHubAccountFiltering = false;
    };
  };

  my.vesktop.enable = true;

  home.stateVersion = "25.11";
}
