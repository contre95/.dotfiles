{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement

      # podman.extraPackages = [ pkgs.zfs ];
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    containers = {
      # storage.settings = {
      #   storage.driver = "zfs";
      #   storage.graphroot = "/var/lib/containers/storage";
      #   storage.runroot = "/run/containers/storage";
      #   storage.options.zfs.fsname = "zroot/podman";
      # };
      containersConf.settings = {
        containers.dns_servers = [ "8.8.8.8" "8.8.4.4" ];
      };
    };
  };


  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    # docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
  ];
}
