{
  config,
  pkgs,
  lib,
  ...
}:
{

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  programs.adb.enable = true;
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

  # xdg.portal.wlr.enable = true;desktop
  services.dbus.enable = true;
  networking.firewall = {
    enable = false;
  };

  # Android
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  hardware.amdgpu.opencl.enable = true;
  hardware.enableRedistributableFirmware = true;
  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
    winetricks
    protonup
    vulkan-tools
    vulkan-loader
    nv-codec-headers-12
    wineWowPackages.waylandFull
  ];

  programs.coolercontrol = {
    enable = true;
    nvidiaSupport = true;
  };

  # User specific packages for desktop
  home-manager.users.contre =
    { pkgs, ... }:
    {
      programs.git.signing.signByDefault = true;
    };

  # Nvidia
  hardware.nvidia.open = false;
  services.xserver.enable = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.forceFullCompositionPipeline = true;
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ]; # This also enables it for wayland
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  services.xserver.displayManager.startx.enable = true; # No display manager
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # hardware.nvidia.package =
  #   let
  #     rcu_patch = pkgs.fetchpatch {
  #       url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
  #       hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
  #     };
  #   in
  #   config.boot.kernelPackages.nvidiaPackages.mkDriver {
  #     version = "535.154.05";
  #     sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
  #     sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
  #     openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
  #     settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
  #     persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
  #
  #     #version = "550.40.07";
  #     #sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
  #     #sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
  #     #openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
  #     #settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
  #     #persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
  #     patches = [ rcu_patch ];
  #   };
  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta; # 550 as per nixos docs
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
  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];
  # OBS Virtual camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1,2,3 card_label="OBS Cam" exclusive_caps=1 debug=1
  '';
  security.polkit.enable = true;

  fileSystems."/home/heavy-assets" = {
    device = "/dev/disk/by-uuid/474b736a-eb2e-4971-9ff7-d70fcd479d78";
    fsType = "ext4"; # Replace with your filesystem type
  };
}

