{ pkgs, ... }:
{

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Cronjobs

  environment.variables = {
    DISK_SSD_A = "/mnt/SSD";
    DISK_HDD_A = "/mnt/HDD2";
    DISK_HDD_B = "/mnt/HDD";
  };

  # Ports for rootless podman, use iptables to redirect ports here
  boot.kernel.sysctl = {
    "net.ipv4.ip_unprivileged_port_start" = 23;
  };

  # User process persist after sessions logout since it's a server.
  system.activationScripts = {
    enableLingering = ''
      # remove all existing lingering users
      rm -r /var/lib/systemd/linger
      mkdir /var/lib/systemd/linger
      # enable for the subset of declared home-manager users
      touch /var/lib/systemd/linger/contre 
    '';
  };

  networking.wireless.enable = false;
  networking.wireless.iwd.enable = false;
  networking.firewall = {
    enable = false;
    #   interfaces.enp89s0 = {
    #     allowedTCPPorts = [ ];
    #     allowedUDPPorts = [ ];
    #   };
    #   # extraCommands =
    #   #   ''
    #   #     iptables -t nat -I PREROUTING -i enp89s0 -p tcp -m tcp --dport 443 -j REDIRECT --to-ports 4430
    #   #   '';
  };

  home-manager.users.contre = { pkgs, ... }: {
    programs.git.signing.signByDefault = false;
    # home.packages = with pkgs; [
    # ];
  };

  environment.systemPackages = with pkgs; [
    motion
    audit
  ];
  fileSystems."/mnt/HDD2" = {
    device = "/dev/disk/by-uuid/b0b93094-b438-458c-97fe-68d4e49bd007";
    fsType = "ext4"; # Replace with your filesystem type
  };

  fileSystems."/mnt/SSD" = {
    device = "/dev/disk/by-uuid/6373667d-d2c9-4421-bfa8-dc17b5cba982";
    fsType = "ext4"; # Replace with your filesystem type
  };

  fileSystems."/mnt/HDD" = {
    device = "/dev/disk/by-uuid/b84f2f7b-d23f-46e7-bea0-4fcf552ee54c";
    fsType = "ext4"; # Replace with your filesystem type
  };

}
