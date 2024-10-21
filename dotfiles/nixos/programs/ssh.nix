{ config, ... }: {


  home.sessionVariablesExtra = ''
    export SSH_AUTH_SOCK="$(${config.programs.gpg.package}/bin/gpgconf --list-dirs agent-ssh-socket)"
  '';

  programs.ssh = {
    enable = true;
    # forward gpg agent
    matchBlocks = {
      "server.home" = {
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
      Host contre.server
        ForwardAgent yes
        RemoteForward /run/user/1000/gnupg/S.gpg-agent /run/user/1000/gnupg/S.gpg-agent.extra
        ExitOnForwardFailure yes
    '';
  };
}
