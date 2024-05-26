# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  whichMachine = builtins.getEnv "MYENV";
  machineSpecifics =
    if whichMachine == "desktop" then ./desktop.nix
    else if whichMachine == "notebook" then ./notebook.nix
    else if whichMachine == "server" then ./server.nix
    else throw "Please set the variable WHICH_MACHINE first";
in
{
  imports =
    [
      # Include the results of the hardware scan.
      machineSpecifics
      ./sound.nix
      ./programs/hyprland.nix
      ./programs/waybar.nix
      ./programs/zsh.nix
    ];

  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    EDITOR = "nvim";
  };

  environment.systemPackages = with pkgs; [

    # Languages
    go
    jq
    cargo
    pyenv
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
    tmux
    gnupg
    neovim

    # Essentials OS 
    fzf
    gcc
    git
    bash
    nmap
    wget
    rsync
    gnumake
    ripgrep
    envsubst

    # Desktop apps
    discord
    obs-studio
    alacritty
    librewolf
    telegram-desktop

     # Sound
    pipewire
    wireplumber
    pavucontrol

    # Desktop Environment 
    dunst
    waybar
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
    wl-clipboard
    wayland-utils
    wayland-protocols
    rofi-wayland-unwrapped
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "${whichMachine}"; # Define your hostname.
  #  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Programs 


  programs.gnupg = {
    agent.enable = true;
    agent.enableSSHSupport = true;
    agent.pinentryFlavor = "curses";
  };

  # Environment setup
  nix.settings.experimental-features = [ "nix-command" ];
  # Networking
  networking.networkmanager.enable = true;

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
    nerdfonts
  ];
  # List packages installed in system profile. To search, run:

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
