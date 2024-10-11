{ pkgs, config, ... }:
# let
#   socketDir = "/run/user/1000/gnupg";
# in
{

  programs.ssh = {
    package = pkgs.openssh;
    startAgent = false; # GPG act as ssh-agent
    # AddKeysToAgent yes
    extraConfig = ''
      Host contre.server, 192.168.0.174
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra
        ExitOnForwardFailure yes
    '';
  };

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      # AllowUsers = null; # Allows all users by default. Can be [ "user1" "user2" ]
      # hostKeys = null; # This is now working, still creates and reference the hostKeys
      # X11Forwarding = false;
      # LogLevel = "INFO";
      KbdInteractiveAuthentication = true;
    };
    # Allow phone from local network and VPN use password

    extraConfig = ''StreamLocalBindUnlink yes'';

    banner =
      if config.networking.hostName == "notebook" then
        "
                           .
                          | \/|
                          ) )|/|
                    _----. /.'.'
.-._________..      .' @ _\  .'   
'.._______.   '.   /    (_| .')
  '._____.  /   '-/      | _.' 
   '.______ (         ) ) \
     '..____ '._       )  )
        .' __.--\  , ,  // ((
        '.'  ---|  \/   (_.'(  
                '   \ .' 
                 \   (
                  \   '.
      notebook     \ \ '.)

"
      else if config.networking.hostName == "desktop" then
        "
             _.-````'-,_
   _,.,_ ,-'`           `'-.,_
 /)     (\                   '``-.
((      ) )                      `\
 \)    (_/                        )\
  |       /)           '    ,'    / \
  `\    ^'            '     (    /  ))
    |      _/\ ,     /    ,,`\   (   `
     \Y,   |  \  \  | ````| / \_ \
       `)_/    \  \  )    ( >  ( >
                \( \(     |/   |/
      desktop   /_(/_(    /_(  /_(

"
      else if config.networking.hostName == "server" then
        "
                          .' `'.__
                         /      \ `'`-,
        .-''''--...__..-/ .     |      \
      .'               ; :'     '.  a   |
     /                 | :.       \     =\
    ;                   \':.      /  ,-.__;.-;`
   /|     .              '--._   /-.7`._..-;`
  ; |       '                |`-'      \  =|
  |/\        .   -' /     /  ;         |  =/
  (( ;.       ,_  .:|     | /     /\   | =|
   ) / `\     | `''`;     / |    | /   / =/
     | ::|    |      \    \ \    \ `--' =/
    /  '/\    /       )    |/     `-...-`
   /    | |  `\    /-'    /;
   \  ,,/ |    \   D    .'  \
    `''`   \__nnh  D_.-'L__nnh    server

"
      else "";
  };

  users.users."contre".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDDerFiqrReOVcinSCWlIoGG31zGGDtnPKiz919RQvEmQTZ6hir7aVQB6/wsNGUse+YEXYoihNdNKkxiXBUS5CJ3w9fc4y4vm6/Q4TQxqqAZg03D+o9UC7009z2YPyz+4pF+74OiPhXLv9JWtVvzscc33NbO9/ipzU+Gi1KmVx7S1ma5dvckaduar4PttqGjxaZ2KDpbu+ZXtsoLLJPWSzpKvUaLnXLY3ZfZtT4jxQZ3UyFFMmyf4Ljq+o8oQctiQbW+or/DN1WwgpVDh3CwMu7jBle8XrfQpINqJVKVR7y13Hy+EifIwNKD1aHKD4MV4wjFSxihNiSy3CUhsrrBxrzu8+RWRKk5dV13f+YU5xBjhvVwqA5mTFtzf6HfznjETtIPGxS1wQGAK+G+2wDzzGYvdOjIwAKfQIrrE7o08JoQ8jewJPwpi9J6XHgwPTfgZk1187Zg9seKWWWKLP9q1IqDW1er1QGEtOr03dU+G8puY5EJQnoSoQ+0/DRiG7MBGkBbSn0wJS4RDGLroDGSR8RWgB3DpnQ3TKc/Y8eCj6+492WXhNMFSKSshzI7tUo0q5hE3vQxabYgcwAxJ2uFKbAf4c7zXnq5Y4czkRj7FXFZcXCHfktVh3Svsu9GQCLJ4tuJbUYGjI2hiqiPMCrugqdtM69OmdnP+uXfh2ghb+GPQ== contre"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDq4Nd146y7JE2Z4J5DvSixTbt2ktTVOsUL2ptUGltzueGUg2C/02iDSxFKD6aY7CaKYkJl5vnAmpKtcgVOYqt390OgfNUoIRoBZPyXwDXRwhdq7CzHrzQtx/Yjo8fr8O+CPc9KUXqtoxwjr6rLwWX787L/OZBmNZ7ACNhIA4jwEP4kF2tT4v309gzT9JryUa+tWskSBzS3cQ5+T5EEzwXzuwJamjCUYVCg21J5N7tV5qu+DbuTVpJtXG4TgtXQGdHfMHxwDjhoczYGJi2YZ7/0Gq+aKNiuqzcbMexd+6YcH4jpnhf9hO1Qh3OzHGiRPh/32BNqvov49ma+VUBM9r/lTvDmlXccvCf/mlDnjf2Q9mHNMT0QxE2HnhkRyCJjz+jKU5VJNh2CirMmAQEYhtg0/XY6U/fxCYiikFbxk83E3qNydZMjId8502xIs9tYLsZXTeT0el/3WDOvP1LaMjNem4WvRqBa3qi9tomqLU1qGQqrO6FEkiENH8MXHjk3p/AXoRHfpHGR6kmFZwc0S5uEylhRP+OCpJa7MKtMTLfLMg6q6PiBBUPNxEHwp65I9rhcCIKdlT+UGCgKuB3/Mur0iud1hBQuRZx9oOB/r7Ui2kN5/mXzKdW4PO37tSiUJePcMH/s7RuMOFGOz+611ZHWUqVkQpX1l0GDmNH6aAbD9Q== u0_a308@localhost"
  ];
}
