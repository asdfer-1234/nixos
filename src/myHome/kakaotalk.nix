{
  myLib,
  kakaotalk,
  pkgs,
  ...
}:
with myLib;
(mkToggleModule [ "my" "kakaotalk" ] {
  home.packages = [ kakaotalk.packages.${pkgs.stdenv.hostPlatform.system}.kakaotalk ];
})
