{ lib, pkgs, ... }:
let
  # Machine and environemnt definition
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  machineConfig =
    if
      lib.elem whichMachine [
        "notebook"
        "server"
        "desktop"
        "macbook"
      ]
    then
      "${whichMachine}.nix"
    else
      throw "Please set the variable WHICH_MACHINE first";
  os =
    if
      lib.elem whichMachine [
        "notebook"
        "server"
        "desktop"
      ]
    then
      "linux"
    else
      "osx";
in
{
  networking.hostName = "${whichMachine}";

  imports =
    if "${os}" == "linux" then
      [
        ./home/contre.nix
        ./system/boot.nix
        ./system/test.nix
        ./system/fonts.nix
        ./system/shell.nix
        ./system/sound.nix
        ./system/version.nix
        ./system/graphics.nix
        ./system/security.nix
        ./system/bluetooth.nix
        ./system/containers.nix
        ./system/networking.nix
        ./system/monitoring.nix
        ./machines/${machineConfig}
        (import "${home-manager}/nixos")
        /etc/nixos/hardware-configuration.nix
      ]
    else if "${os}" == "osx" then
      [
        ./machines/${machineConfig}
        ./home/work.nix
      ]
    else
      throw "Uknown OS";

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # Local certificate
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  # Common env variables
  environment.variables = {
    PAGER = "";
    EDITOR = "nvim";
    KEYTIMEOUT = "10";
    NIXOS_OZONE_WL = "1";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    MYENV = "${whichMachine}";
    XDG_SESSION_TYPE = "wayland";
    WHICH_MACHINE = "${whichMachine}";
  };

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users =
    if os == "linux" then
      {
        contre = {
          uid = 1000;
          shell = pkgs.zsh;
          isNormalUser = true;
          extraGroups = [
            "wheel"
            "video"
            "dialout"
            "kvm"
            "adbusers"
          ];
        };
      }
    else
      { };
}
