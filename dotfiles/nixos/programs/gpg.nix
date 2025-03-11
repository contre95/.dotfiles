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
          pinentryPackage = pkgs.pinentry-gnome3;
          sshKeys = [ "B38C2E9A5402A38D13E510DADD0B71744684EA35" ]; # [A] Subkey with auth capabilities.
          # extraConfig = ''
          #   extra-socket /run/user/1000/gnupg/S.gpg-agent.extra
          #   allow-loopback-pinentry
          # '';
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
        "notebook"
        "desktop"
        "server"
      ]
    then
      {
        # programs.gpg = {
        #   enable = true;
        #   scdaemonSettings = {
        #     # reader-port = "Yubico Yubi";
        #     pcsc-driver = "${lib.getLib pkgs.pcsclite}/lib/libpcsclite.so";
        #     pcsc-shared = true;
        #     disable-ccid = true;
        #   };
        #   # settings.no-autostart = true; # don’t autostart gpg-agent if not started
        #   # settings = {
        #   #   use-agent = "";
        #   # };
        #   # mutableKeys = true;
        #   # mutableTrust = false;
        #   # homedir = "${config.xdg.dataHome}/gnupg";
        #   publicKeys = [
        #     {
        #       source = ../contre.pub;
        #       trust = 5;
        #     }
        #   ];
        # };
      }
    else
      { };
}
