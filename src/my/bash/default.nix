{
  lib,
  config,
  ...
}:
with lib;
{
  options.my.bash.enable = mkEnableOption "";
  config = mkIf config.my.bash.enable {
    programs.bash =
      let
        init = fileContents init.bash;
      in
      {
        enable = true;
        interactiveShellInit = init;
        loginShellInit = init;
      };
  };
}
