{
  lib,
  myLib,
  ...
}:
with lib;
with myLib;
{
  options = {
    secret.networks = mkOption { };
  };

  imports = mkImports [
    ./definitions
  ];
}
