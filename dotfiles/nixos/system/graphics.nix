{ pkgs, ... }: {
  # Enable Graphics (Hyprland needs to be enable at a systems level)

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-hyprland
    xwayland
    wlroots
    xdg-launch
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland,x11";
    # QT_QPA_PLATFORM = "wayland;xcb";
    LIBVA_DRIVER_NAME = "nvidia";
    XMODIFIERS = "@im=ibus";
    MOZ_DBUS_REMOTE= "1";
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    MOZ_ENABLE_WAYLAND = "1";
    # MOZ_USE_XINPUT2 = "1";
    GDK_SCALE = "1";
    GBM_BACKEND = "nvidia-drm";
    BROWSER = "librewolf.desktop";
    TERMINAL = "alacritty";
    QT_QPA_PLATFORMTHEME = "gtk";
    SDL_VIDEODRIVER = "wayland";
    QT_SCALE_FACTOR = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WLR_NO_GARDWARE_CURSORS = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    CLUTTER_BACKEND = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    XDG_CACHE_HOME = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
    XDG_BIN_HOME = "\${HOME}/.local/bin";
    XDG_DATA_HOME = "\${HOME}/.local/share";

  };



  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    # config = {
    #   common.default = [ "hyprland" ];
    #   hyprland.default = [ "gtk" "hyprland" ];
    # };
    #
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
  };

}
