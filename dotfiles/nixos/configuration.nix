{lib, pkgs, ... }:
let
  # Machine and environemnt definition
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
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
      ./system/gpg.nix
      ./system/sound.nix
      ./users/contre.nix
      ./system/openssh.nix
      ./system/graphics.nix
      ./system/bluetooth.nix
      ./system/syncthings.nix
      ./system/shell.nix
      ./system/containers.nix
      ./system/networking.nix
      ./system/node-exporter.nix
      ./machines/${machineConfig}
      (import "${home-manager}/nixos")
      /etc/nixos/hardware-configuration.nix
    ] else if "${os}" == "macos" then [
      ./system/gpg.nix
      ./users/work.nix
      ./system/shell.nix
      ./system/containers.nix
      (import "${home-manager}/nixos")
    ]
    else throw "Uknown OS";

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Common env variables
  environment.variables = {
    PAGER = "";
    MYENV = "${whichMachine}";
    EDITOR = "nvim";
    MY_FOLDER = if os == "linux" then "/home/canus" else "/Users/lucas.contreras/.dotfiles";
    SCR_PATH = "$MY_FOLDER/scripts";
  };


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable/Disable deafult system programs 
  programs.nano.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users =
    if os == "linux" then {
      contre = {
        isNormalUser = true;
        shell = pkgs.zsh;
        uid = 1000;
        description = "Yerno VIP aka Master Senior";
        extraGroups = [ "wheel" ];
      };
    } else { };

  # Fonts
  fonts.packages = [
    (unstable.nerdfonts.override { fonts = [ "JetBrainsMono" "Iosevka" "FiraCode" ]; })
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
