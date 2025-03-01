{ ... }:
  {
    networking.firewall = {
      allowedUDPPorts = [ 51028 ]; # Clients and peers can use the same port, see listenport
    };
    # Enable Wireguard
    networking.wireguard.interfaces = {
      wg0 = {
        # Determines the IP address and subnet of the client's end of the tunnel interface.
        ips = [ "10.16.12.93" ];

        # Path to the private key file.
        #
        # Note: The private key can also be included inline via the privateKey option,
        # but this makes the private key world-readable; thus, using privateKeyFile is
        # recommended.
        privateKeyFile = "~/.wg/pk.key";

        peers = [
          # For a client configuration, one peer entry for the server will suffice.
          {
            # Public key of the server (not a file path).
            publicKey = "TkzWsGsHIaWm7Cj9xw5J94q4rMm1unrEGJz6ep5NnRo=";

            # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
            # For a server peer this should be the whole subnet.
            allowedIPs = [ "0.0.0.0/0" ];

            # Set this to the server IP and port.
            endpoint = "79.152.165.88:51820";

            # Send keepalives every 25 seconds. Important to keep NAT tables alive.
            # persistentKeepalive = 25;
          }
        ];
      };
    };
  }
