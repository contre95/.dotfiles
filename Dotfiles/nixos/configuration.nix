# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man pagecon
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  # Home Manager
  # home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  # Unstable packages only for <unstable.package_name>
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  # Pich machine base on MYENV
  whichMachine = builtins.getEnv "MYENV";
  machineSpecifics =
    if whichMachine == "desktop" then ./desktop.nix
    else if whichMachine == "notebook" then ./notebook.nix
    else if whichMachine == "server" then ./server.nix
    else throw "Please set the variable WHICH_MACHINE first";
in
{
  imports = [
    # (import "${home-manager}/nixos")
    /etc/nixos/hardware-configuration.nix
    ./system/networking.nix
    ./system/sound.nix
    ./system/hardware.nix
    ./programs/hyprland.nix
    ./programs/waybar.nix
    ./programs/zsh.nix
    ./programs/librewolf.nix
    ./programs/git.nix
    ./programs/${machineSpecific}.ssh.nix
    ./programs/gpg.nix
    machineSpecifics
  ];
  # networking.networkmanager.enable = true;
  networking.hostName = "${whichMachine}";

  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    PAGER = "";
    EDITOR = "nvim";
  };

  environment.systemPackages = with pkgs; [

    # Languages
    go
    jq
    cargo
    python3
    # pyenv # Creo que esto ya no tiene más sentido
    # virtualenv

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
    pinentry
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
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.contre = {
    isNormalUser = true;
    shell = pkgs.zsh;
    uid = 1000;
    description = "Yerno VIP aka Master Senior";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" ]; })
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
