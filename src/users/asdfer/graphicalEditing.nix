{ pkgs, ... }:
{
  home.packages = with pkgs; [
    inkscape
    aseprite
    gimp
  ];
  xdg.mimeApps.defaultApplications =
    let
      inkscape = "org.inkscape.Inkscape.desktop";
    in
    {
      "image/svg" = inkscape;
      "image/svg+xml" = inkscape;
    };
}
