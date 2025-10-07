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
        environment.systemPackages = with pkgs; [
          # unstable.kdePackages.qtvirtualkeyboard
          # unstable.kdePackages.isoimagewriter
          # unstable.squeekboard
          # unstable.onboard
          # unstable.kdePackages.qtvirtualkeyboard
          # unstable.libsForQt5.qt5.qtvirtualkeyboard
          unstable.maliit-keyboard
          unstable.maliit-framework
          unstable.wayland-utils
        ];
      }
    else
      { };
}
