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
    home.packages = with pkgs; [
      obs-studio
    ];
  };
  services.xserver.displayManager.startx.enable = true;

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.enable = true;
  services.xserver.dpi = 100;
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.open = false;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;

}
