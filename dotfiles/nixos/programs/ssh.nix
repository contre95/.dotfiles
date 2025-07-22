{
  lib,
  config,
  pkgs,
  ...
}:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  socketDir = "/run/user/1000/gnupg";
in
{
  config =
    if
      lib.elem whichMachine [
        "notebook"
        "tablet"
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
          matchBlocks = {
            "tablet.home" = {
              user = "contre";
              forwardAgent = true;
              remoteForwards = [
                {
                  bind.address = "${socketDir}/S.gpg-agent";
                  host.address = "${socketDir}/S.gpg-agent.extra";
                }
                {
                  bind.address = "${socketDir}/S.gpg-agent.ssh";
                  host.address = "${socketDir}/S.gpg-agent.ssh";
                }
              ];
            };
            "notebook.home" = {
              user = "contre";
              forwardAgent = true;
              remoteForwards = [
                {
                  bind.address = "${socketDir}/S.gpg-agent";
                  host.address = "${socketDir}/S.gpg-agent.extra";
                }
                {
                  bind.address = "${socketDir}/S.gpg-agent.ssh";
                  host.address = "${socketDir}/S.gpg-agent.ssh";
                }
              ];
            };
            "desktop.home" = {
              user = "contre";
              forwardAgent = true;
              remoteForwards = [
                {
                  bind.address = "${socketDir}/S.gpg-agent";
                  host.address = "${socketDir}/S.gpg-agent.extra";
                }
                {
                  bind.address = "${socketDir}/S.gpg-agent.ssh";
                  host.address = "${socketDir}/S.gpg-agent.ssh";
                }
              ];
            };
            "server.home" = {
              user = "contre";
              forwardAgent = true;
              remoteForwards = [
                {
                  bind.address = "${socketDir}/S.gpg-agent";
                  host.address = "${socketDir}/S.gpg-agent.extra";
                }
                {
                  bind.address = "${socketDir}/S.gpg-agent.ssh";
                  host.address = "${socketDir}/S.gpg-agent.ssh";
                }
              ];
              # sendEnv = [
              #   "SSH_AUTH_SOCK=${socketDir}/S.gpg-agent.ssh"
              # ];
            };
          };

          extraConfig = ''
            PKCS11Provider ${pkgs.opensc}/lib/opensc-pkcs11.so
          '';
        };
      }
    else
      { };
}

