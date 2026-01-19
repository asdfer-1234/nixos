{ pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.logiops
  ];
  systemd.services.logid = {
    enable = true;
    startLimitIntervalSec = 0;
    description = "enables logid from logiops package";
    after = [ "multi-user.target" ];
    wants = [ "multi-user.target" ];
    wantedBy = [ "graphical.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.logiops}/bin/logid";
      User = "root";
    };
  };
  environment.etc."logid.cfg".source = "logid.cfg";
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
