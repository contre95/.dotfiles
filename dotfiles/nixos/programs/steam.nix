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
          protontricks
          r2modman
          protonup-qt
        ];
        programs.steam = {
          enable = true;
          remotePlay.openFirewall = true;
          dedicatedServer.openFirewall = true;
          localNetworkGameTransfers.openFirewall = true;
          gamescopeSession.enable = true;
          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];
        };
      }
    else
      { };
}
