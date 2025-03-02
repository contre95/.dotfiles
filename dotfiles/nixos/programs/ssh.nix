{
  lib,
  config,
  pkgs,
  ...
}:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
in
{
  config =
    if
      lib.elem whichMachine [
        "notebook"
        "desktop"
      ]
    then
      {
        home.sessionVariablesExtra = ''
          export SSH_AUTH_SOCK="$(${config.programs.gpg.package}/bin/gpgconf --list-dirs agent-ssh-socket)"
        '';
        # Packager related to ssh
        home.packages = with pkgs; [
          sshfs
          sshpass
        ];
        programs.ssh = {
          enable = true;
          # forward gpg agent
          matchBlocks = {
            "server.home" = {
              user = "contre";
              forwardAgent = true;
              remoteForwards = [
                {
                  bind.address = "/run/user/1000/gnupg/S.gpg-agent";
                  host.address = "/run/user/1000/gnupg/S.gpg-agent.extra";
                }
                {
                  bind.address = "/run/user/1000/gnupg/S.gpg-agent.ssh";
                  host.address = "/run/user/1000/gnupg/S.gpg-agent.ssh";
                }
              ];
            };
          };

          extraConfig = ''
            PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so
            Host notebook.home, desktop.home
              ForwardAgent yes
              ExitOnForwardFailure yes
            Host server.home
              ForwardAgent yes
              ExitOnForwardFailure yes
              RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra
          '';
        };
      }
    else
      { };
}
