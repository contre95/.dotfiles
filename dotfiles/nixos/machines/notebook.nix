{ config, lib, pkgs, modulesPath, home-manager, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      # devices = [ "nodev" ];
      # efiSupport = true;
      configurationLimit = 10;
      extraEntries = {
        "audiotfix.conf" = ''
          title Audiofix
          linux /ssdt-csc3551.aml
        '';
      };

    };
  };
  # Environment Packages
  environment.systemPackages = with pkgs; [ acpi brightnessctl ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };


  # # User specific
  # home-manager.users.contre = { pkgs, ... }: {
  #   home.packages = with pkgs; [
  #   ];
  # };

}
