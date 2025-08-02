{
  lib,
  hostname,
  pkgs,
  ...
}:
{
  config =
    if
      lib.elem hostname [
        "desktop"
      ]
    then
      {
        programs.obs-studio = {
          enable = true;
          plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-pipewire-audio-capture
            advanced-scene-switcher
            input-overlay
            obs-backgroundremoval
          ];
        };
      }
    else
      { };
}
