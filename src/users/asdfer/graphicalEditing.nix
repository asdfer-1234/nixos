{ pkgs, ... }:
{
  home.packages = with pkgs; [
    inkscape
    aseprite
    gimp
  ];
  xdg.mimeApps.defaultApplications = {
    "image/svg" = "inkscape.desktop";
    "image/svg+xml" = "inkscape.desktop";
  };
}
