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
        "server"
        "tablet"
      ]
    then
      {
        environment.systemPackages = with pkgs; [
          gamemode
          goverlay
          mangohud
          protontricks
          # r2modman
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
