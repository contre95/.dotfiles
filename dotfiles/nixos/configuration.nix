{ config, pkgs, lib, ... }:
let
  # Machine and environemnt definition
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz";
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  machineConfig =
    if lib.elem whichMachine [ "notebook" "server" "desktop" "macos" ] then "${whichMachine}.nix"
    else throw "Please set the variable $WHICH_MACHINE first";
  os = if lib.elem whichMachine [ "notebook" "server" "desktop" ] then "linux" else "osx";
in
{
  networking.hostName = "${whichMachine}";

  imports =
    if "${os}" == "linux" then [
      (import "${home-manager}/nixos")
      ./system/sound.nix
      ./system/bluetooth.nix
      ./system/networking.nix
      ./system/openssh.nix
      ./users/contre.nix
      ./machines/${machineConfig}
      /etc/nixos/hardware-configuration.nix
    ] else if "${os}" == "macos" then
      [
        (import "${home-manager}/nixos")
        ./machines/${machineConfig}
        ./users/work.nix
      ]
    else throw "Uknown OS";

  # Move this somewhere else with home manager or organize better
  programs.zsh.enable = os == "linux";
  programs.hyprland.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };


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
    if os == "linux" then {
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
