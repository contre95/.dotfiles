{
  lib,
  pkgs,
  config,
  ...
}:
{
  programs.gpg = {
    enable = true;
    scdaemonSettings = {
      # reader-port = "Yubico Yubi";
      pcsc-driver = "${lib.getLib pkgs.pcsclite}/lib/libpcsclite.so";
      pcsc-shared = true;
      disable-ccid = true;
    };
    # settings.no-autostart = true; # don’t autostart gpg-agent if not started
    settings = {
      use-agent = "";
    };
    # mutableKeys = true;
    # mutableTrust = false;
    # homedir = "${config.xdg.dataHome}/gnupg";
    publicKeys = [
      {
        source = ../contre.pub;
        trust = 5;
      }
    ];
  };

  services.gpg-agent = {
    enable = true;
    verbose = true;
    defaultCacheTtl = 1300;
    enableScDaemon = true;
    enableSshSupport = true;
    enableExtraSocket = true;
    grabKeyboardAndMouse = true;
    enableZshIntegration = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
    extraConfig = ''
      extra-socket /run/user/1000/gnupg/S.gpg-agent.extra
    '';
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
        RemainAfterExit = true;
        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/1000/gnupg %h/.gnupg-sockets";
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}
