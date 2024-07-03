{ ... }: {
  networking.wireless.iwd.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.useDHCP = true;
  networking.useNetworkd = true;
  networking.networkmanager.enable = false;
  systemd.network.enable = true;
  networking.wireless.iwd.settings = {
    Settings = {
      AutoConnect = true;
      AlwaysRandomizeAddress = false;
    };
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.firewall = {
    enable = true;
  };
}
