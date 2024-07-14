{ lib, pkgs, ... }:
let
  # Machine and environemnt definition
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  machineConfig =
    if lib.elem whichMachine [ "notebook" "server" "desktop" "macbook" ] then "${whichMachine}.nix"
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
      ./system/test.nix
      ./system/boot.nix
      ./system/fonts.nix
      ./system/containers.nix
      ./system/networking.nix
      ./system/version.nix
      ./system/node-exporter.nix
      ./machines/${machineConfig}
      (import "${home-manager}/nixos")
      /etc/nixos/hardware-configuration.nix
    ] else if "${os}" == "osx" then [
      ./machines/${machineConfig}
      ./users/work.nix
    ]
    else throw "Uknown OS";

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Common env variables
  environment.variables = {
    PAGER = "";
    KEYTIMEOUT = 10;
    LANG = "en_US.UTF-8";
    PASSWORD_STORE_DIR = "$MY_FOLDER/pass";
    LC_ALL = "en_US.UTF-8";
    MYENV = "${whichMachine}";
    EDITOR = "nvim";
    MY_FOLDER = if os == "linux" then "/home/canus" else "/Users/canus/";
    PATH =
      if os == "linux" then
        "$PATH:$MY_FOLDER/bin:$MY_FOLDER/scripts/bin-scr" else
        "$PATH:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/";
    SCR_PATH = "$MY_FOLDER/scripts";
  };


  # Set your time zone.
  time.timeZone = "Europe/Madrid";

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
}
