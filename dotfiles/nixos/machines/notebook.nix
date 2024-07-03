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
  environment.systemPackages = with pkgs; [ acpi ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
  hardware = {
    opengl.enable = true;
    opengl.driSupport = true;
    opengl.driSupport32Bit = true;
    opengl.extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  # # User specific
  home-manager.users.contre = { pkgs, ... }: {
    home.packages = with pkgs; [
      brightnessctl
    ];
  };

}
