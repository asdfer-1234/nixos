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
      gimp = "gimp.desktop";
    in
    {
      "image/svg" = inkscape;
      "image/svg+xml" = inkscape;
      "image/png" = gimp;
    };
}
