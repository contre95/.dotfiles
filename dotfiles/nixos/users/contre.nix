{ ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;

  environment.variables = { };

  # Contre
  home-manager.users.contre = { pkgs, ... }: {
    xdg.mimeApps.defaultApplications = {
      "text/html" = "org.mozilla.librewolf.desktop";
      "x-scheme-handler/http" = "org.mozilla.librewolf.desktop";
      "x-scheme-handler/https" = "org.mozilla.librewolf.desktop";
      "x-scheme-handler/about" = "org.mozilla.librewolf.desktop";
    };
    programs.home-manager.enable = true;
    home.username = "contre";
    home.homeDirectory = "/home/contre";
    home.stateVersion = "24.05";
    imports = [
      ../programs/gpg.nix
      ../programs/gtk.nix
      ../programs/test.nix
      ../programs/git.nix
      ../programs/librewolf.nix
    ];

    home.packages = with pkgs; [
      # Languages
      go
      jq
      cargo
      python3
      terraform


      # LSP
      sqls
      black
      gopls
      pyright
      nil
      tfsec
      tflint
      terraform-ls
      nixpkgs-fmt
      yamlfmt
      marksman
      efm-langserver
      lua-language-server

      # Essentials User 
      zsh
      stow
      bandwhich
      autojump
      awscli
      tree
      zbar
      tree-sitter
      kubectl
      tmux
      (pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))
      gnupg
      vlc
      cliphist
      mpv
      neovim

      # Essentials OS 
      fzf
      wdisplays
      less
      gcc
      coreutils
      feh
      git
      prometheus-node-exporter
      bash
      btop
      nmap
      wget
      wirelesstools
      iwd
      rsync
      gnumake
      ripgrep
      envsubst

      # Desktop apps
      discord
      betterdiscordctl
      alacritty
      # librewolf
      telegram-desktop

      # Desktop Environment 

      pcmanfm
      dunst
      unstable.waybar
      swappy
      grim
      slurp
      gnome.zenity
      wf-recorder
      pinentry-qt
      hyprpaper
      librsvg
      clipman
      gammastep
      libnotify
      hyprshade
      wl-clipboard
      hyprpicker
      libsForQt5.qt5.qtwayland
      qt5.full
      wayland-utils
      wayland-protocols
      rofi-wayland
      polkit

    ];

    home.file = {
      neovim = {
        recursive = true;
        source = /home/canus/dotfiles/nvim;
        target = ".config/nvim";
      };

      rofi = {
        recursive = true;
        source = /home/canus/dotfiles/rofi;
        target = ".config/rofi";
      };

      tmux = {
        recursive = false;
        source = /home/canus/dotfiles/tmux/.tmux.conf;
        target = "./.tmux.conf";
      };

      wireplumber = {
        recursive = true;
        source = /home/canus/dotfiles/wireplumber;
        target = ".config/wireplumber";
      };

      waybar = {
        recursive = true;
        source = /home/canus/dotfiles/waybar;
        target = ".config/waybar";
      };

      hyprland = {
        recursive = true;
        source = /home/canus/dotfiles/hypr;
        target = ".config/hypr";
      };

      keyboard = {
        recursive = true;
        source = /home/canus/dotfiles/keybaord;
        target = ".config/xkb";
      };

      dunst = {
        recursive = true;
        source = /home/canus/dotfiles/dunst;
        target = ".config/dunst";
      };

      zshrc = {
        recursive = false;
        source = /home/canus/dotfiles/zsh/.zshrc;
        target = "./.zshrc";
      };

      zsh = {
        recursive = false;
        source = /home/canus/dotfiles/zsh/.zsh;
        target = "./.zsh";
      };

      alacritty = {
        recursive = true;
        source = /home/canus/dotfiles/alacritty;
        target = ".config/alacritty";
      };

    };
  };
}



