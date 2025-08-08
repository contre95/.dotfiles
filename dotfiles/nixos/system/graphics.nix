{ pkgs, unstable, ... }:
{

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.libxcb
    zenity
    lm_sensors
    unstable.iio-sensor-proxy
    unstable.iio-hyprland
    gammastep
    dunst
    unstable.wtype
    unstable.swww
    unstable.hyprpicker
    unstable.grim
    unstable.slurp
    unstable.grimblast
    wofi
    rofi-wayland
    wdisplays
    unstable.wayland-scanner
    unstable.nwg-drawer
    unstable.clickclack
    unstable.wvkbd
    unstable.hyprpaper
    hdrop
    unstable.hyprshade
    unstable.waybar
    unstable.wayland-utils
    unstable.wayland-protocols
    # unstable.hyprgui
    unstable.inotify-tools # sudo inotifywait -m -r /path/to/disk/mountpoint
    unstable.hyprlandPlugins.hyprgrass
    unstable.hyprcursor
    unstable.xcur2png
    unstable.v4l-utils
    unstable.librsvg
    unstable.libnotify
    unstable.hyprland-protocols
    unstable.wev
    unstable.hyprland-workspaces
    # hyprdim
    unstable.hyprlock
    unstable.xwayland
    unstable.aquamarine
    unstable.wlroots
  ];

  environment.variables = {

    GDK_SCALE = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_USE_XINPUT2 = "1";
    QT_IM_MODULE = "ibus";
    GTK_IM_MODULE = "ibus";
    WLR_DRM_NO_ATOMIC = "1";
    MOZ_ENABLE_WAYLAND = "1";
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_DATA_HOME = "\${HOME}/.local/share";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
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
