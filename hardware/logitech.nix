{ pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.logiops
  ];
  systemd.services.logid = {
    enable = true;
    description = "enables logid from logiops package";
    after = [ "multi-user.target" ];
    wants = [ "multi-user.target" ];
    wnatedBy = [ "graphical.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.logiops}/bin/logid";
      User = "root";
    };
  };
}

/*
  [Unit]
  Description=Logitech Configuration Daemon
  StartLimitIntervalSec=0
  After=multi-user.target
  Wants=multi-user.target

  [Service]
  Type=simple
  ExecStart=/nix/store/wgsz2zbkd7yqq8ihcch4dli56v7xv8lh-logiops-0.3.5/bin/logid
  User=root

  [Install]
  WantedBy=graphical.target
*/
