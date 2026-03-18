{ lib }:
with lib;
{
  importGen = imports: forEach imports (p: (if ((pathIsDirectory p)) then p else (p + ".nix")));
}
