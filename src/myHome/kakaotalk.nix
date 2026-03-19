{
  config,
  myLib,
  kakaotalk,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/kakaotalk {
  home.packages = [ kakaotalk.packages.${pkgs.stdenv.hostPlatform.system}.kakaotalk ];
}
