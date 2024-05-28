{ config , ... }:
let
  hostname = config.networking.hostName; 
in 
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = if hostname == "notebook" then false else true;
      AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      X11Forwarding =  if hostname == "notebook" then false else true;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
};
}

