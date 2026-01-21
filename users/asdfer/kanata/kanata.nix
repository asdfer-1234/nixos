{ config, configDirectory, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${configDirectory}${path}";
in
{
  xdg.configFile = {
    "kanata/kanata.kbd" = {
      source = link "/users/asdfer/kanata/kanata.kbd";
      force = true;
    };
  };
}
