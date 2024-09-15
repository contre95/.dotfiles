{ pkgs, config, ... }:

{
  programs.gpg = {
    enable = true;
    # mutableKeys = true;
    # mutableTrust = false;
    # homedir = "${config.xdg.dataHome}/gnupg";
    publicKeys = [
      { source = ../contre.pub; trust = 5; }
    ];
  };

  services.gpg-agent = {
    enable = true;
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
    enableSshSupport = true;
    verbose = true;
    defaultCacheTtl = 1300;
    enableZshIntegration = false;
    enableExtraSocket = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableScDaemon = true;
    grabKeyboardAndMouse = true;
    # extraConfig = ''
    #   pinentry-program ${pkgs.pinentry-gnome3}/bin/pinentry-gnome3
    #   allow-loopback-pinentry
    #   auto-expand-secmem
    # '';
  };

  systemd.user.services = {
    # Link /run/user/$UID/gnupg to ~/.gnupg-sockets
    # So that SSH config does not have to know the UID
    link-gnupg-sockets = {
      Unit = {
        Description = "link gnupg sockets from /run to /home";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/%U/gnupg %h/.gnupg-sockets";
        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
        RemainAfterExit = true;
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}

