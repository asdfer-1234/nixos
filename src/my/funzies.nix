{
  config,
  pkgs,
  myLib,
  ...
}:
with myLib;
mkEnableModule config /my/funzies {
  environment.systemPackages = with pkgs; [
    cbonsai
    cowsay
    sl
  ];
}
