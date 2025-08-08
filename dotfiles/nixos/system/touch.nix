{
  lib,
  pkgs,
  unstable,
  hostname,
  ...
}:
{
  config =
    if
      lib.elem hostname [
        "tablet"
      ]
    then
      {
        services = {
          desktopManager.plasma6.enable = true;
        };
        services.displayManager.sddm = {
          enable = true;
          # package = pkgs.kdePackages.sddm;
          wayland.enable = true;
        };
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
