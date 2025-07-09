{ pkgs, ... }:
{
  networking.firewall.allowedUDPPorts = [ 51028 ];
  environment.systemPackages = with pkgs; [ wireguard-tools ];
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [ "10.95.95.3/32" ];
      dns = [ "10.95.95.1" ];
      # privateKeyFile = "/root/wireguard-keys/privatekey";
      privateKeyFile = "/etc/wireguard/private.key";
      # cat /etc/wireguard/private.key | wg pubkey 
      # oALQ7rQgzqDgVZVOjTqUc7u1rpLUMFEE68UY0Flo5iM=

      peers = [
        {
          publicKey = "Ql8XtFwJs1DJic3YXtj+1BlZHCmPn0Koh0TNQD8HLSY=";
          presharedKeyFile = "/etc/wireguard/shared.key";
          allowedIPs = [
            "0.0.0.0/0"
          ];
          endpoint = "vpn.contre.io:51208";
          persistentKeepalive = 25;
        }
      ];
    };
  };
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ]; # Replace with your actual group (e.g., "users", "sudo")
      commands = [
        {
          command = "/usr/bin/env systemctl start wg-quick-wg0.service"; # Use "@" if your service is templated
          options = [ "NOPASSWD" ];
        }
        {
          command = "/usr/bin/env systemctl stop wg-quick-wg0.service";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
