{ lib, pkgs, ... }:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
in
{
  config =
    if
      lib.elem whichMachine [
        "desktop"
        "notebook"
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
