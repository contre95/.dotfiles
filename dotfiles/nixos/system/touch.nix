{ lib, pkgs, ... }:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  config =
    if
      lib.elem whichMachine [
        "tablet"
      ]
    then
      {
        services = {
          desktopManager.plasma6.enable = true;
          displayManager.sddm.enable = true;
          displayManager.sddm.wayland.enable = true;
        };
        services.displayManager.sddm.setupScript = ''
          ${pkgs.wvkbd}/bin/wvkdb-mobintl &
        '';
        environment.plasma6.excludePackages = with pkgs.kdePackages; [
          konsole # Comment out this line if you use KDE's default terminal app
        ];
        environment.systemPackages = with pkgs; [
          unstable.kdePackages.qtvirtualkeyboard
          unstable.kdePackages.isoimagewriter
          # unstable.squeekboard
          # unstable.onboard
          unstable.kdePackages.qtvirtualkeyboard
          unstable.libsForQt5.qt5.qtvirtualkeyboard
          unstable.maliit-keyboard
          unstable.maliit-framework
          unstable.wayland-utils
          hardinfo2 # System information and benchmarks for Linux systems
        ];
      }
    else
      { };
}
