{ pkgs, ... }:
{
  # openssl s_client -connect <your-server-url>:443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM > server_cert.pem
  security.rtkit.enable = true;

  security.sudo = {
    enable = true;
    extraRules = [{
      commands = [
        {
          command = "/run/current-system/sw/bin/nixos-rebuild";
          options = [ "NOPASSWD" ];
        }
      ];
      users = [ "contre" ];
    }];
    # extraConfig = with pkgs; ''
    #   Defaults:nixos-rebuild secure_path="${lib.makeBinPath [
    #     systemd
    #   ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
    # '';
  };
}
