{ config, pkgs, ... }:
{
  
  systemd.network.enable = true;
  networking.wireless.enable = false;
  networking.useDHCP = true;
  networking.useNetworkd = true;
  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = config.networking.hostName != "server";
  networking.wireless.iwd.settings = {
    Settings = {
      AutoConnect = true;
      AlwaysRandomizeAddress = false;
    };
  };
  networking.firewall = {
    allowedTCPPorts = [
      3535
    ];
  };
  # Packager related to Networking
  environment.systemPackages = with pkgs; [
    iwd
    dig
    nmap
    iwgtk
    netcat
    tcpdump
    wireshark
    traceroute
    speedtest-cli
    wirelesstools
  ];

  # Groups related to Networking
  users.users.contre = {
    extraGroups = [ "networkmanager" ];
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
