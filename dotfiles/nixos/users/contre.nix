{ pkgs, home-manager, config, ... }:
let
  # Unstable packages only for <unstable.package_name>
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;

  # Contre
  home-manager.users.contre = { pkgs, ... }: {
    programs.home-manager.enable = true;
    home.username = "contre";
    home.homeDirectory = "/home/contre";
    home.stateVersion = "23.11";
    imports = [
      ../programs/gpg.nix
      ../programs/gtk.nix
      ../programs/git.nix
      ../programs/librewolf.nix
    ];

    home.packages = with pkgs; [
      # Languages
      go
      jq
      cargo
      python3

      # LSP
      sqls
      black
      gopls
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
      tree-sitter
      kubectl
      tmux
      pass
      gnupg
      vlc
      mpv
      neovim

      # Essentials OS 
      fzf
      less
      gcc
      coreutils
      git
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
      obs-studio
      alacritty
      librewolf
      telegram-desktop

      # Desktop Environment 
      pcmanfm
      dunst
      unstable.waybar
      wlroots
      swappy
      grim
      slurp
      gnome.zenity
      pinentry-qt
      xwayland
      hyprpaper
      clipman
      gammastep
      libnotify
      hyprshade
      wl-clipboard
      hyprpicker
      hyprland
      wayland-utils
      wayland-protocols
      rofi-wayland-unwrapped
      polkit
      dconf
      gtk3
      gtk4
      yaru-theme
      papirus-nord
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland

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

    };
  };

}


