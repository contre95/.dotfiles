{ config, ... }:
let
  hostname = config.networking.hostName;
in
{
  programs.ssh.startAgent = false; # GPG act as ssh-agent
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      hostKeys = null; # This is now working, still creates and reference the hostKeys
      X11Forwarding = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };

    extraConfig = ''
      Match Address 192.168.0.170/32
        PasswordAuthentication yes
      Match Address 192.168.0.172/32,10.8.0.0/24
        PasswordAuthentication yes
    '';
  };
  users.users."contre".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDerFiqrReOVcinSCWlIoGG31zGGDtnPKiz919RQvEmQTZ6hir7aVQB6/wsNGUse+YEXYoihNdNKkxiXBUS5CJ3w9fc4y4vm6/Q4TQxqqAZg03D+o9UC7009z2YPyz+4pF+74OiPhXLv9JWtVvzscc33NbO9/ipzU+Gi1KmVx7S1ma5dvckaduar4PttqGjxaZ2KDpbu+ZXtsoLLJPWSzpKvUaLnXLY3ZfZtT4jxQZ3UyFFMmyf4Ljq+o8oQctiQbW+or/DN1WwgpVDh3CwMu7jBle8XrfQpINqJVKVR7y13Hy+EifIwNKD1aHKD4MV4wjFSxihNiSy3CUhsrrBxrzu8+RWRKk5dV13f+YU5xBjhvVwqA5mTFtzf6HfznjETtIPGxS1wQGAK+G+2wDzzGYvdOjIwAKfQIrrE7o08JoQ8jewJPwpi9J6XHgwPTfgZk1187Zg9seKWWWKLP9q1IqDW1er1QGEtOr03dU+G8puY5EJQnoSoQ+0/DRiG7MBGkBbSn0wJS4RDGLroDGSR8RWgB3DpnQ3TKc/Y8eCj6+492WXhNMFSKSshzI7tUo0q5hE3vQxabYgcwAxJ2uFKbAf4c7zXnq5Y4czkRj7FXFZcXCHfktVh3Svsu9GQCLJ4tuJbUYGjI2hiqiPMCrugqdtM69OmdnP+uXfh2ghb+GPQ== contre"
  ];
}
