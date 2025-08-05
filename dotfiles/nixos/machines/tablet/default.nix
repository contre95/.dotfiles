{
  lib,
  config,
  inputs,
  unstable,
  pkgs,
  ...
}:
{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  imports = [
    inputs.nixos-hardware.nixosModules.asus-flow-gv302x-amdgpu
  ];

  hardware.asus.flow.gv302x = {
    keyboard.autosuspend.enable = true;
    ite-device.wakeup.enable = true;
    amdgpu = {
      recovery.enable = false;
      sg_display.enable = true;
      psr.enable = true;
    };
  };

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  services.power-profiles-daemon.enable = false;
  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = false;
    fanCurvesConfig.source = ./fanCurvesConfig.text;
    asusdConfig.source = ./asusdConfig.text;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
    };
  };
  # Environment Packages
  environment.systemPackages = with pkgs; [
    unstable.acpi
    unstable.asusctl
    # unstable.fwupd
    # unstable.supergfxctl
    linuxKernel.packages.linux_6_15.asus-ec-sensors
    brightnessctl
    nvtopPackages.amd
  ];

  hardware.sensor.iio.enable = true;
  boot.initrd.availableKernelModules = [
    "nvme"
    "nvme_core" # Core NVMe support
    "xhci_pci"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];

  boot.initrd.kernelModules = [
    "amdgpu" # AMD GPU driver
    "nvme"
    "nvme_core" # Core NVMe support
    "xhci_pci"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  #hardware.graphics.package = lib.mkForce pkgs.unstable.mesa.drivers;
  hardware.amdgpu.initrd.enable = true; # load amdgpu kernelModules in stage 1.
  hardware.amdgpu.opencl.enable = true; # OpenCL support - general compute API for gpu
  hardware.amdgpu.amdvlk.enable = true; # additional, alternative drivers

  # Disable AMD GPU runtime power management (fixes SDDM context creation issues)
  boot.kernelParams = [
    "amdgpu.runpm=0" # Disable runtime power management (can cause issues with SDDM)
    "amdgpu.dc=1" # Enable Display Core
    "amdgpu.dpm=1" # Enable Dynamic Power Management
  ];

  hardware.graphics = {
    enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
