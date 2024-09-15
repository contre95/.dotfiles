{ config, ... }: {


  home.sessionVariablesExtra = ''
    export SSH_AUTH_SOCK="$(${config.programs.gpg.package}/bin/gpgconf --list-dirs agent-ssh-socket)"
  '';

  programs.ssh = {
    enable = true;

    # forward gpg agent
    matchBlocks = {
      "contre@contre.server" = {
        remoteForwards = [
          {
            bind.address = "/run/user/1000/gnupg/S.gpg-agent";
            host.address = "/\${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.extra";
          }
          {
            bind.address = "/run/user/1000/gnupg/S.gpg-agent.ssh";
            host.address = "/\${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh";
          }
        ];
      };
    };

    extraConfig = "Include config.local";
  };
}
