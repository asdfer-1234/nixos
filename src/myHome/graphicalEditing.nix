{
  config,
  myLib,
  pkgs,
  ...
}:
with myLib;
mkEnableModule config /my/graphicalEditing {
  home.packages = with pkgs; [
    inkscape
    adwaita-icon-theme
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
      "image/jpeg" = gimp;
    };
}
