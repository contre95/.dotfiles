# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man pagecon
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
let
  # Machine and environemnt definition
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  machineConfig =
    if lib.elem whichMachine [ "notebook" "server" "desktop" "macos" ] then "${whichMachine}.nix"
    else throw "Please set the variable $WHICH_MACHINE first";
  distro = if lib.elem whichMachine [ "notebook" "server" "desktop" ] then "linux" else "osx";
in
{
  networking.hostName = "${whichMachine}";
  imports = [
    (import "${home-manager}/nixos")
    /etc/nixos/hardware-configuration.nix
    ./${machineConfig}
    ./programs/ssh.nix
    ./programs/gpg.nix
    ./system/networking.nix
    ./system/sound.nix
    ./system/gtk.nix
    ./system/common.packages.nix
    ./system/bluetooth.nix
    ./programs/librewolf.nix
    ./programs/git.nix
  ];
  # Enable common programs 
  programs.zsh.enable = distro == "linux";
  programs.hyprland.enable = true;

  # Environment variables
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    PAGER = "";
    EDITOR = "nvim";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users =
    if distro == "linux" then {
      contre = {
        isNormalUser = true;
        shell = pkgs.zsh;
        uid = 1000;
        description = "Yerno VIP aka Master Senior";
        extraGroups = [ "wheel" ];
        packages = with pkgs; [ ];
      };
    } else { };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka" ]; })
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
