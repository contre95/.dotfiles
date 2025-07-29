{ lib, pkgs, hostname, ... }:
{
  config =
    if lib.elem hostname [ "notebook" "tablet" "desktop" ]
    then {
      environment.systemPackages = with pkgs; [ gnupg ];
      services.pcscd.enable = true;
      services.dbus.packages = [ pkgs.gcr ];
      services.yubikey-agent.enable = true;
      hardware.gpgSmartcards.enable = true;
    }
    else {
      environment.systemPackages = with pkgs; [ gnupg ];
    };
}
