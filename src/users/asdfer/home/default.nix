{
  pkgs,
  lib,
  myLib,
  kakaotalk,
  ...
}:
with lib;
{
  imports = myLib.importGen [
    ../../myHome
  ];

  my.rice.asdfrice.enable = true;

  my.uni.enable = true;
  my.tex.enable = true;
  my.zed.enable = true;
  my.firefox.enable = true;
  my.graphicalEditing.enable = true;

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
    prismlauncher
    thunderbird
    alacritty
    fuzzel
    baobab
    code
    dragon-drop
    drawio
    kakoune
    kdePackages.kate
    light
    mate.atril
    qjackctl
    rhythmbox
    libreoffice
    # deadbeef # BUILD FAILS
    # Image viewers
    imv
    swayimg
    # File managers
    xfce.thunar
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
    tetrio-desktop
    kakaotalk.packages.${pkgs.stdenv.hostPlatform.system}.kakaotalk
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
