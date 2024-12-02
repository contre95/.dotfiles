{ config, pkgs, lib, ... }:
{

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Environment Packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
  programs.nix-ld.enable = true;


  environment.variables = {
    DISK_SSD_A = "/home/contre/server-poc/ssd";
    DISK_HDD_A = "/home/contre/server-poc/hdd2";
    DISK_HDD_B = "/home/contre/server-poc/hdd";
  };


  # xdg.portal.wlr.enable = true;
  services.dbus.enable = true;

  networking.firewall = {
    enable = false;
  };

  # Android
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
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
  hardware.amdgpu.opencl.enable = true;
  hardware.enableRedistributableFirmware = true;

  # System programs config
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    # "steam"
    # "steam-original"
    # "steam-run"
  ];

  # User specific packages for desktop
  home-manager.users.contre = { pkgs, ... }: {
    programs.git.signing.signByDefault = true;
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


  # Nvidia
  hardware.nvidia.open = false;
  services.xserver.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  services.xserver.displayManager.startx.enable = true; # No display manager
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #   version = "555.58.02";
  #   sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
  #   sha256_aarch64 = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
  #   openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
  #   settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
  #   persistencedSha256 = lib.fakeSha256;
  # };

  # Mount disks
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
