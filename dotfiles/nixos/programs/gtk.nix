{ pkgs, config, ... }:
{
  home.packages = [ pkgs.glib ]; # gsettings

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = 1;
    XCURSOR_SIZE = "16";
    GTK_USE_PORTAL = "1";
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };


  # qt = {
  #   enable = true;
  #   platformTheme = "gtk";
  #   style = {
  #     name = "adwaita-dark";
  #     package = pkgs.adwaita-qt;
  #   };
  # };
    qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      name = "Catppuccin-Frappe-Dark";
      package = pkgs.catppuccin-kde.override {
        flavour = ["frappe"];
        accents = ["pink"];
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark-Compact";
      package = pkgs.orchis-theme;
    };
    #
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };
    #
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
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
