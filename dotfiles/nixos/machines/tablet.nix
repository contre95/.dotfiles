{
  lib,
  config,
  pkgs,
  ...
}:
let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "balanced";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_performance";

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      # CPU_MIN_PERF_ON_AC = 0;
      # CPU_MAX_PERF_ON_AC = 100;
      # CPU_MIN_PERF_ON_BAT = 0;
      # CPU_MAX_PERF_ON_BAT = 80;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;

    };
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
    acpi
    unstable.asusctl
    upower
    brightnessctl
    nvtopPackages.amd
  ];

  hardware.sensor.iio.enable = true;
  # hardware.asus.flow.gv302x = {
  #   keyboard.autosuspend.enable = true;
  #   ite-device.wakeup.enable = true;
  #   amdgpu = {
  #     recovery.enable = false;
  #     sg_display.enable = true;
  #     psr.enable = true;
  #   };
  # };

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
    "sdhci_pci"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  hardware.graphics = {
    enable = true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
