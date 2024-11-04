{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  # home-manager.users.contre = {
  #
  #   home.file = {
  #     ".config/containers/containers.conf".text = ''
  #       [containers]
  #       annotations=["run.oci.keep_original_groups=1"]
  #         '';
  #   };
  # };

  # Enable common container config files in /etc/containers
  virtualisation = {
    oci-containers.backend = "podman";
    podman = {
      enable = true;
      autoPrune = {
        enable = true;
        flags = [ "-af" ];
      };

      # Create a `docker` alias for podman, to use it as a drop-in replacement

      # podman.extraPackages = [ pkgs.zfs ];
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    containers = {
      enable = true;
      # storage.settings = {
      #   storage.driver = "zfs";
      #   storage.graphroot = "/var/lib/containers/storage";
      #   storage.runroot = "/run/containers/storage";
      #   storage.options.zfs.fsname = "zroot/podman";
      # };
      containersConf.settings = {
        containers.dns_servers = [ "10.12.95.2" "1.1.1.1" ]; # Will this work as a fallback to 1.1.1.1 ? 
      };
    };
  };


  # Useful otherdevelopment tools
  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    unstable.podman
    # docker-compose # start group of containers for dev
    podman-compose # start group of containers for dev
  ];
}
