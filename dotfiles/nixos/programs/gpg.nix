{
  lib,
  pkgs,
  config,
  ...
}:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  cfg = config.services.gpg-agent;
in
{
  config =
    if
      lib.elem whichMachine [
        "notebook"
        "desktop"
        "tablet"
        "server"
      ]
    then
      {
        services.gpg-agent = {
          enable = true;
          verbose = true;
          defaultCacheTtl = 1300;
          enableScDaemon = true;
          enableSshSupport = true;
          enableExtraSocket = true;
          grabKeyboardAndMouse = true;
          enableZshIntegration = true;
          pinentry.package =
            if lib.elem whichMachine [ "server" ] then pkgs.pinentry-curses else pkgs.pinentry-gnome3;
          # pinentry.package = pkgs.pinentry-curses;
          sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
          extraConfig = ''
            extra-socket /run/user/1000/gnupg/S.gpg-agent.extra
            allow-loopback-pinentry
          '';
        };
        systemd.user.services.gpg-agent-socketdir = {
          Unit = {
            Description = "Create GnuPG socket directory";
            Documentation = "man:gpgconf(1)";
          };
          Service = {
            Type = "oneshot";
            ExecStart =
              "${pkgs.gnupg}/bin/gpgconf --create-socketdir" + lib.optionalString cfg.verbose " --verbose";
            RemainAfterExit = true;
          };
          Install = {
            WantedBy = [ "default.target" ];
          };
        };
      }
    else if
      lib.elem whichMachine [
        "tablet"
        "notebook"
        "desktop"
      ]
    then
      {
        programs.gpg = {
          enable = true;
          homedir = "${config.xdg.dataHome}/gnupg";
          settings = {
            keyserver = "hkps://keys.openpgp.org";
            use-agent = true;
          };
          scdaemonSettings = {
            reader-port = "Yubico.com Yubikey 4/5 OTP+U2F+CCID";
            pcsc-driver = "${lib.getLib pkgs.pcsclite}/lib/libpcsclite.so";
            # pcsc-driver = "${pkgs.pcsclite.lib}/lib/libpcsclite.so";
            pcsc-shared = true;
            ## with pcsc-shared the pin is asked every time, this fixes it
            ## https://dev.gnupg.org/T5436
            # disable-application = "piv";
            disable-ccid = false;
          };
          # settings.no-autostart = true; # don’t autostart gpg-agent if not started
          # settings = {
          #   use-agent = "";
          # };
          # mutableKeys = true;
          # mutableTrust = false;
          publicKeys = [
            {
              source = ../contre.pub;
              trust = 5;
            }
          ];
        };
      }
    else
      { };
}

