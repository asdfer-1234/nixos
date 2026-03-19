{
  config,
  lib,
  myLib,
  pkgs,
  ...
}:
with lib;
with myLib;
mkEnableModule config /my/core {
  environment.systemPackages = with pkgs; [
    tldr
    killall
    ranger
    ripgrep
    p7zip
    trashy
    tree
    yt-dlp
    pciutils # lspci
  ];
  my.bash.enable = true;
  my.fetches.enable = true;
  my.funzies.enable = true;
  programs.vim.enable = true;
  programs.neovim.enable = true;
  programs.htop.enable = true;
  programs.git.enable = true;
}
