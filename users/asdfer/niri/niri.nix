{ ... }:
{
  xdg.configFile = {
    "niri/" = {
      source = ./dotfile;
      force = true;
    };
  };
}
