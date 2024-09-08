{ pkgs, config, ... }:

{
  programs.gpg = {
    enable = true;
    mutableKeys = true;
    mutableTrust = false;
    homedir = "${config.xdg.dataHome}/gnupg";
    publicKeys = [
      { source = ../contre.pub; trust = 5; }
    ];
  };

  services.gpg-agent = {
    enable = true;
    sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
    enableSshSupport = true;
    verbose = true;
    # 16 hour cache timeout
    defaultCacheTtl = 16 * 60 * 60;
    defaultCacheTtlSsh = 16 * 60 * 60;
    maxCacheTtl = 24 * 60 * 60;
    maxCacheTtlSsh = 24 * 60 * 60;
    enableZshIntegration = true;
    enableExtraSocket = true;
    enableScDaemon = true;
    grabKeyboardAndMouse = false;
    extraConfig = ''
      pinentry-program ${pkgs.pinentry-gnome3}/bin/pinentry-gnome3
      allow-loopback-pinentry
      auto-expand-secmem
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
        ExecStart = "${pkgs.coreutils}/bin/ln -Tfs /run/user/%U/gnupg %h/.gnupg-sockets";
        ExecStop = "${pkgs.coreutils}/bin/rm $HOME/.gnupg-sockets";
        RemainAfterExit = true;
      };
      Install.WantedBy = [ "default.target" ];
    };
  };
}

