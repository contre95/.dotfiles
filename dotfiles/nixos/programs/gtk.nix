{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nwg-look # gtk configuration tool
    # libsForQt5.qt5ct # qt5 configuration tool
    # kdePackages.qt6ct # qt6 configuration tool
    # libsForQt5.qtstyleplugin-kvantum # svg based qt6 theme engine
    # kdePackages.qtstyleplugin-kvantum # svg based qt5 theme engine
    # gtk3 # gtk3
    # gtk4 # gtk4
    # gsettings-desktop-schemas # gsettings schemas
    # desktop-file-utils # for updating desktop database
    # hicolor-icon-theme # Base fallback icon theme
    # adwaita-icon-theme # Standard GNOME icons, excellent fallback
    # libsForQt5.breeze-icons # KDE's icon set, good for Qt apps
    # dconf-editor # dconf editor
    # gnome-tweaks # gnome tweaks
    # kdePackages.qt6gtk2
    # libsForQt5.qt5.qtwayland
    #themes
    # juno-theme
    # zuki-themes
    # ayu-theme-gtk
    # nordic
    # flat-remix-gtk
    # maia-icon-theme
    # flat-remix-icon-theme
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    LIBVA_DRIVER_NAME = "nvidia";
    XMODIFIERS = "@im=ibus";
    MOZ_DBUS_REMOTE = "1";
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    QT_SCALE_FACTOR = "1";
    GTK_USE_PORTAL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    XCURSOR_SIZE = "16";
    # QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
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
    # style = {
    #   name = "Catppuccin-Frappe-Dark";
    #   package = pkgs.catppuccin-kde.override {
    #     flavour = [ "frappe" ];
    #     accents = [ "pink" ];
    #   };
    # };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };

    cursorTheme = {
      name = "Elementary";
    };

    iconTheme = {
      name = "Colloid";
      package = pkgs.colloid-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
    };

  };
  dconf.settings."org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
}
