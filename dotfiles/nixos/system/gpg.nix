{
  pkgs,
  lib,
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
        # Enable GPG Smartcards (Like Yubikeys)
        hardware.gpgSmartcards.enable = true;
      }
    else
      { };
}
