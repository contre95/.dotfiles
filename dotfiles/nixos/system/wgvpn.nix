{ pkgs, ... }:
{
  networking.firewall.allowedUDPPorts = [ 51028 ];
  environment.systemPackages = with pkgs; [ wireguard-tools ];
  networking.wg-quick.interfaces = {
    wg0 = {
      autostart = false;
      address = [ "10.16.12.93/32" ];
      dns = [ "10.16.12.1" ];
      # privateKeyFile = "/root/wireguard-keys/privatekey";
      privateKeyFile = "/etc/wireguard/private.key";

      peers = [
        {
          publicKey = "TkzWsGsHIaWm7Cj9xw5J94q4rMm1unrEGJz6ep5NnRo=";
          # presharedKeyFile = "/root/wireguard-keys/preshared_from_peer0_key";
          allowedIPs = [
            "0.0.0.0/0"
          ];
          endpoint = "vpn.contre.io:51028";
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
