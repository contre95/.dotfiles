{ config, lib, pkgs, modulesPath, home-manager, ... }:

{
  # Environment Packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;


  xdg.portal.wlr.enable = true;
  services.dbus.enable = true;

  # System packages for desktop
  environment.systemPackages = with pkgs; [ ];

  # User specific packages for desktop
  home-manager.users.contre = { pkgs, ... }: {

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    };

  };


  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.dpi = 100;
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  # Nvidia
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  services.xserver.displayManager.startx.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;

  # Kernel Packages

  # OBS Virtual camera 
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;

}
