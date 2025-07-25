{ lib, pkgs, ... }:

let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  # Mapping of machine name to its WireGuard IP address
  machineIPs = {
    tablet = "10.95.95.10/32";
    notebook = "10.95.95.20/32";
    desktop = "10.95.95.30/32";
  };

  allowedMachines = builtins.attrNames machineIPs;
  isClientMachine = lib.elem whichMachine allowedMachines;

  wgAddress = machineIPs.${whichMachine} or (throw "Unknown WHICH_MACHINE: ${whichMachine}");
in
{
  imports = [
    # Make sure nixpkgs has sops-nix available
    "${
      builtins.fetchTarball {
        url = "https://github.com/Mic92/sops-nix/archive/master.tar.gz";
      }
    }/modules/sops"
  ];

  networking.firewall.allowedUDPPorts = [ 51028 ];

  environment.systemPackages = with pkgs; [ wireguard-tools sops];

  networking.wg-quick.interfaces = lib.mkIf isClientMachine {
    wg0 = {
      autostart = false;
      address = [ wgAddress ];
      dns = [ "10.95.95.1" ];
      privateKeyFile = "/etc/wireguard/private.key";

      peers = [
        {
          publicKey = "Ql8XtFwJs1DJic3YXtj+1BlZHCmPn0Koh0TNQD8HLSY=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "vpn.contre.io:51802";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [
        {
          command = "/usr/bin/env systemctl start wg-quick-wg0.service";
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
