{ config, ... }: {
  networking.wireless.iwd.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.useDHCP = true;
  networking.useNetworkd = true;
  networking.networkmanager.enable = false;
  systemd.network.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 9100 ];
    # allowedUDPPortRanges = [
    #   { from = 4000; to = 4007; }
    #   { from = 8000; to = 8010; }
    # ];
  };
}
