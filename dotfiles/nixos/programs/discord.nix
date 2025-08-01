{ lib, hostname, pkgs, ... }:
{
  config =
    if
      lib.elem hostname [
        "desktop"
        "tablet"
        "notebook"
      ]
    then
      {
        home.packages = with pkgs; [
          (vesktop.overrideAttrs (oldAttrs: {
            desktopItems = [
              (pkgs.makeDesktopItem {
                name = "vesktop";
                desktopName = "Vesktop";
                icon = "discord";
                startupWMClass = "discord";
                exec = "vesktop --disable-features=WebRtcAllowInputVolumeAdjustment %U";
                keywords = [
                  "discord"
                  "vencord"
                  "electron"
                  "chat"
                ];
                categories = [
                  "Network"
                  "InstantMessaging"
                  "Chat"
                ];
              })
            ];
          }))
          (pkgs.discord.override {
            withOpenASAR = true;
            withVencord = false;
          })
        ];
      }
    else
      { };
}
