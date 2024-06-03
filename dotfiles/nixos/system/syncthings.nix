{ home-preset, ... }:
{
  networking.firewall = {
    allowedUDPPorts = [
      # syncthing QUIC
      22000
      # syncthing discovery broadcast on ipv4 and multicast ipv6
      21027
    ];

    allowedTCPPorts = [
      42355
      # syncthing
      22000
    ];
  };
  services = {
    syncthing = {
      enable = true;
      user = "contre";
      # dataDir = "/home/contre/Documents/syncthings/data";
      configDir = "/home/contre/.config/syncthing";
      overrideDevices = false; # overrides any devices added or deleted through the WebUI
      overrideFolders = false; # overrides any folders added or deleted through the WebUI
      settings = {
        options = {
          relaysEnabled = false;
          localAnnounceEnabled = true;
        };
        gui = {
          insecureSkipHostcheck = true;
          insecureAdminAccess = true;
        };
        devices = {
          "nuc" = { id = "D6ZKEKW-NSUXQOK-TCZYKPU-KPT2L3O-IHEJPO5-DV4CN57-KKIW6B4-H6SVUAC"; };
        };
        # folders = {
          # "Example" = {
          #   path = "/home/myusername/Example";
          #   devices = [ "device1" ];
          #   ignorePerms = false; # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          # };
        # };
      };
    };
  };
}
