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
    ./graphicalEditing
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
    baobab
    code
    dragon-drop
    drawio
    kakoune
    qtPackages.kate
    light
    mate.atril
    qjackctl
    rhythmbox
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
    discord
    # zsa keyboards
    keymapp
    wally-cli
    git-credential-manager
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

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.11";
}
