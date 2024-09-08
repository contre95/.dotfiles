{ config, pkgs, lib, ... }:

{
  # Environment Packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
  programs.nix-ld.enable = true;


  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };


  # xdg.portal.wlr.enable = true;
  services.dbus.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    wineWowPackages.waylandFull
    lutris
    mangohud
    winetricks
    vulkan-loader
    vulkan-tools
    nv-codec-headers-12
  ];

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true;
  };

  # System programs config
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];


  # User specific packages for desktop
  home-manager.users.contre = { pkgs, ... }: {
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-pipewire-audio-capture
        advanced-scene-switcher
        input-overlay
        obs-backgroundremoval
      ];
    };

  };


  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };


  # Nvidia
  hardware.nvidia.open = true;
  services.xserver.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  services.xserver.displayManager.startx.enable = true; # No display manager
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

  # Mount disks
  # fileSystems."/home/canus/mounts/games" = {
  #   device = "/dev/nvme1n1p1";
  #   fsType = "ext4"; # Replace with your filesystem type
  # };
  boot.kernelModules = [ "v4l2loopback" ];
  # Kernel Packages
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
  # OBS Virtual camera 
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1,2,3 card_label="OBS Cam" exclusive_caps=1 debug=1
  '';
  security.polkit.enable = true;

}
