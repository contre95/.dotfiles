{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dconf-editor # dconf editor
    dconf
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    LIBVA_DRIVER_NAME = "nvidia";
    XMODIFIERS = "@im=ibus";
    MOZ_DBUS_REMOTE = "1";
    QT_SCALE_FACTOR = "1";
    GTK_USE_PORTAL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    QT_QUICK_CONTROLS_STYLE="org.kde.breeze";
    XCURSOR_SIZE = "16";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    cursorTheme = {
      name = "breeze_cursors";
      size = 24;
    };

    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
    };

  };
  gtk.gtk3.extraConfig = {
    gtk-application-prefer-dark-theme = true;
    gtk-toolbar-style = 3;
    gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    gtk-button-images = 0;
    gtk-menu-images = 0;
    QT_QPA_PLATFORMTHEME = "qt5ct";
    gtk-enable-event-sounds = 1;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-cursor-blink = true;
    gtk-cursor-blink-time = 1000;
    gtk-decoration-layout = "icon:minimize,maximize,close";
    gtk-enable-animations = true;
    gtk-primary-button-warps-slider = true;
    gtk-sound-theme-name = "ocean";
    gtk-xft-dpi = 98304;
  };
  gtk.gtk4.extraConfig = {
    gtk-application-prefer-dark-theme = true;
    gtk-cursor-blink = true;
    gtk-toolbar-style = 3;
    gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    gtk-button-images = 0;
    gtk-menu-images = 0;
    gtk-enable-event-sounds = 1;
    gtk-enable-input-feedback-sounds = 0;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-cursor-blink-time = 1000;
    gtk-decoration-layout = "icon:minimize,maximize,close";
    gtk-enable-animations = true;
    gtk-primary-button-warps-slider = true;
    gtk-sound-theme-name = "ocean";
    gtk-xft-dpi = 98304;
  };
  dconf.settings."org.maliit.keyboard.maliit" = {
    key-press-haptic-feedback = true;
    theme = "Sweet";
  };
}
