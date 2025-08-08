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
        "notebook"
        "tablet"
      ]
    then
      {
        environment.systemPackages = with pkgs; [
          itch # Play itch.io games
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
