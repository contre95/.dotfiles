{ pkgs, ... }:
let
  # Unstable packages only for <unstable.package_name>
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  environment.systemPackages = with pkgs; [

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
    home-manager
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
    bluez
    bluez5-experimental
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

    # Sound
    pipewire
    pw-volume
    pamixer
    wireplumber
    pavucontrol

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
    gtk2
    gtk3
    gtk4
    yaru-theme
    papirus-nord
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
