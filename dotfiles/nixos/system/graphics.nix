{ pkgs, unstable, ... }:
{

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.libxcb
    zenity
    lm_sensors
    gammastep
    dunst
    iio-sensor-proxy
    iio-hyprland
    wtype
    swww
    hyprpicker
    grim
    slurp
    wofi
    rofi-wayland
    wdisplays
    hdrop
    wayland-scanner
    nwg-drawer
    clickclack
    wvkbd
    hyprpaper
    hyprshade
    waybar
    wayland-utils
    wayland-protocols
    inotify-tools # sudo inotifywait -m -r /path/to/disk/mountpoint
    hyprlandPlugins.hyprgrass
    hyprcursor
    xcur2png
    v4l-utils
    librsvg
    libnotify
    hyprland-protocols
    wev
    hyprland-workspaces
    hyprlock
    xwayland
    aquamarine
    wlroots
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    GDK_SCALE = "1";
    # GBM_BACKEND = "nvidia-drm";
    TERMINAL = "alacritty";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    # WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    CLUTTER_BACKEND = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_CURRENT_DESKTOP = "Hyprland";
    QT_IM_MODULE = "ibus";
    GTK_IM_MODULE = "ibus";
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
