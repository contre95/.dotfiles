{ pkgs, ... }:
let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  # Enable Graphics (Hyprland needs to be enable at a systems level)
  environment.systemPackages = with pkgs; [
    zenity
    gammastep
    dunst
    unstable.swww
    wofi
    rofi-wayland
    wdisplays
    unstable.wayland-scanner
    # inputs.swww.packages.${pkgs.system}.swww
    unstable.hyprpaper
    hdrop
    unstable.hyprshade
    unstable.waybar
    unstable.wayland-utils
    unstable.wayland-protocols
    # unstable.hyprgui
    unstable.inotify-tools # sudo inotifywait -m -r /path/to/disk/mountpoint
    unstable.hyprcursor
    unstable.xcur2png
    unstable.librsvg
    unstable.libnotify
    unstable.hyprland-protocols
    unstable.wev
    unstable.hyprland-workspaces
    # hyprdim
    unstable.xwayland
    unstable.aquamarine
    unstable.wlroots
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    GDK_SCALE = "1";
    GBM_BACKEND = "nvidia-drm";
    TERMINAL = "alacritty";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    # WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    CLUTTER_BACKEND = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";

  };

  hardware.graphics.enable = true;
  programs.hyprland = {
    enable = true;
    package = unstable.hyprland;
    portalPackage = unstable.xdg-desktop-portal-hyprland;
    withUWSM = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

}
