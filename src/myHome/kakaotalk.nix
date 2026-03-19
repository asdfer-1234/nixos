{ myLib, kakaotalk, ... }:
with myLib;
mkToggleModule [ "my" "kakaotalk" ] {
  environment.systemPackages = [ kakaotalk.packages.${pkgs.stdenv.hostPlatform.system}.kakaotalk ];
}
