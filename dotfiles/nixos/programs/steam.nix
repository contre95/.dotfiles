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
        "tablet"
      ]
    then
      {
        environment.systemPackages = with pkgs; [
          file
          gamemode
          goverlay
          mangohud
          mangohud
          r2modman
          protonup-qt
        ];
        programs.steam = {
          enable = true;
          remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
          gamescopeSession.enable = true;
          extraCompatPackages = with pkgs; [
            # proton-ge-bin
          ];
        };
      }
    else
      { };
}
