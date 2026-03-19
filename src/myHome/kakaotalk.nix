{
  config,
  myLib,
  kakaotalk,
  pkgs,
  ...
}:
with myLib;
mkToggleModule config [ "my" "kakaotalk" ] {
  home.packages = [ kakaotalk.packages.${pkgs.stdenv.hostPlatform.system}.kakaotalk ];
}
