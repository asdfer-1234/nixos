{
  pkgs,
  ...
}:
{

  imports = [
    ../../asdfrice/rice.nix
    ./zed.nix
  ];

  rice.asdfrice.enable = true;

  programs.bash.enable = true;
  programs.lutris.enable = true;
  programs.firefox.enable = true;
  programs.obs-studio.enable = true;
  programs.neovim.enable = true;
  home.packages = [
    pkgs.thunderbird
    pkgs.git
    pkgs.vim
    pkgs.vulkan-tools
    pkgs.alacritty
    pkgs.fuzzel
    pkgs.swaybg
    # pkgs.deadbeef build fails
    # zsa keyboards
    pkgs.keymapp
    pkgs.wally-cli
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.stateVersion = "25.11";
}
