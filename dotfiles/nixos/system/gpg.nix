{
  pkgs,
  lib,
  config,
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
        services.pcscd.enable = true;
        services.dbus.packages = [ pkgs.gcr ];

        # Enable GPG at a system level
        services.yubikey-agent.enable = true;
        programs.gnupg.dirmngr.enable = true;

        # programs.gnupg.agent = {
        #   enable = true;
        #   enableSSHSupport = true;
        #   enableExtraSocket = true;
        #   pinentryPackage = pkgs.pinentry-gnome3;
        # };

        # Enable GPG Smartcards (Like Yubikeys)
        hardware.gpgSmartcards.enable = true;
      }
    else
      { };
}
