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
  services.power-profiles-daemon.enable = true;
  services.supergfxd.enable = true;
  services.asusd = {
    enable = true;
    enableUserService = false;
    fanCurvesConfig.source = ./fanCurvesConfig.text;
    asusdConfig.source = ./asusdConfig.text;
  };
  # services.power-profiles-daemon.enable = true;
  services.tlp.enable = false;

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
    unstable.bolt
    unstable.ryzenadj
    unstable.upower
    unstable.powercap
    unstable.s-tui
    # unstable.supergfxctl
    linuxKernel.packages.linux_6_15.asus-ec-sensors
    brightnessctl
    nvtopPackages.amd
  ];

  hardware.sensor.iio.enable = true;

  boot.initrd.availableKernelModules = [
    "nvme"
    "nvme_core" # Core NVMe support
    "sd_mod"
    "sdhci_pci"
    "thunderbolt"
    "usb_storage"
    "usbhid"
    "xhci_pci"
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

  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  hardware.amdgpu.initrd.enable = true; # load amdgpu kernelModules in stage 1.
  hardware.amdgpu.opencl.enable = true; # OpenCL support - general compute API for gpu
  hardware.amdgpu.amdvlk.enable = true; # additional, alternative drivers

  # Disable AMD GPU runtime power management (fixes SDDM context creation issues)
  boot.kernelParams = [
    "amdgpu.gpu_recovery=1" # fix kernel hang on suspend
    "amdgpu.runpm=1" # Disable runtime power management if it causes issues with SDDM)
    "amdgpu.dc=1" # Enable Display Core
    "amdgpu.dpm=1" # Enable Dynamic Power Management
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Let's 32Bit GPU accelrated aplications run
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
