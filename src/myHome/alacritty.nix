{
  config,
  myLib,
  ...
}:
with myLib;
mkEnableModule config /my/alacritty {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          foreground = "#5c6166";
          background = "#f8f9fa";
        };
        cursor = {
          text = "#f8f9fa";
          cursor = "#5c6166";
        };
        selection = {
          text = "#5c6166";
          background = "#d3e1f5";
        };
        normal = {
          black = "#000000";
          red = "#ea6c6d";
          green = "#6cbf43";
          yellow = "#eca944";
          blue = "#3199e1";
          magenta = "#9e75c7";
          cyan = "#46ba94";
          white = "#c7c7c7";
        };
        bright = {
          black = "#686868";
          red = "#f07171";
          green = "#86b300";
          yellow = "#f2ae49";
          blue = "#399ee6";
          magenta = "#a37acc";
          cyan = "#4cbf99";
          white = "#d1d1d1";
        };
      };
    };
  };
}
