{ pkgs, ... }:
{
  # services.prometheus.exporters.node.enable = true;
  environment.systemPackages = with pkgs; [
    btop # Like htop which is like top
    prometheus-node-exporter
  ];

  networking.firewall = {
    allowedTCPPorts = [ 9100 ];
  };
  services.prometheus.exporters.node = {
    port = 9100;
    enable = true;
    enabledCollectors = [
      "conntrack"
      "diskstats"
      "entropy"
      "filefd"
      "cpu_vulnerabilities"
      "filesystem"
      "loadavg"
      "mdadm"
      "meminfo"
      "netdev"
      "netstat"
      "stat"
      "time"
      "vmstat"
      "systemd"
      "logind"
      "interrupts"
      "ksmd"
    ];
  };
}
