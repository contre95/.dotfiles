{ config, ... }:
{
  networking.firewall = {
    allowedUDPPorts = [
      22000
      21027
    ];
    allowedTCPPorts = [
      22000
      42355
    ];
  };
  services = {
    syncthing = {
      enable = config.networking.hostName != "server";
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
          "nuc" = {
            id = "D6ZKEKW-NSUXQOK-TCZYKPU-KPT2L3O-IHEJPO5-DV4CN57-KKIW6B4-H6SVUAC";
          };
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
