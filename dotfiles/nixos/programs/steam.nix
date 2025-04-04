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
        environment.systemPackages = with pkgs; [
          r2modman
          file
        ];
        programs.steam = {
          enable = true;
          remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
          dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
          gamescopeSession.enable = true;
          extraCompatPackages = with pkgs; [
            # proton-ge-bin
            # lutris
            # mangohud
          ];
        };
      }
    else
      { };
}
