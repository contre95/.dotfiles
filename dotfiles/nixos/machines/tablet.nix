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
    # TODO: Cleaner
    # fanCurvesConfig.source = ./fanCurvesConfig.text;
    # asusdConfig.source = ./asusdConfig.text;
    fanCurvesConfig.text = ''
      (
          profiles: (
              balanced: [
                  (
                      fan: CPU,
                      pwm: (2, 22, 30, 43, 56, 68, 89, 102),
                      temp: (48, 53, 57, 60, 63, 65, 70, 76),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (2, 22, 33, 45, 58, 71, 94, 107),
                      temp: (48, 53, 57, 60, 63, 65, 70, 76),
                      enabled: false,
                  ),
              ],
              performance: [
                  (
                      fan: CPU,
                      pwm: (26, 51, 89, 140, 166, 191, 217, 242),
                      temp: (30, 40, 50, 60, 70, 80, 90, 100),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (26, 51, 89, 140, 166, 191, 217, 242),
                      temp: (30, 40, 50, 60, 70, 80, 90, 100),
                      enabled: true,
                  ),
              ],
              quiet: [
                  (
                      fan: CPU,
                      pwm: (0, 13, 26, 51, 89, 140, 191, 217),
                      temp: (30, 40, 50, 60, 70, 80, 90, 100),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (0, 13, 26, 51, 89, 140, 191, 217),
                      temp: (30, 40, 50, 60, 70, 80, 90, 100),
                      enabled: true,
                  ),
              ],
              custom: [],
          ),
      )
    '';
    asusdConfig.text = ''
      (
          charge_control_end_threshold: 83,
          disable_nvidia_powerd_on_battery: true,
          ac_command: "",
          bat_command: "",
          platform_profile_linked_epp: true,
          platform_profile_on_battery: Quiet,
          change_platform_profile_on_battery: false,
          platform_profile_on_ac: Quiet,
          change_platform_profile_on_ac: true,
          profile_quiet_epp: BalancePower, // Change to a less aggressive EPP
          profile_balanced_epp: BalancePower,
          profile_custom_epp: Performance,
          profile_performance_epp: Performance,
          ac_profile_tunings: {
              Quiet: (
                  enabled: true,
                  group: {
                      PptPl1Spl: 55,
                      PptPl2Sppt: 65,
                      PptPl3Fppt: 65,
                  },
              ),
              Performance: (
                  enabled: false,
                  group: {},
              ),
              Balanced: (
                  enabled: false,
                  group: {},
              ),
          },
          dc_profile_tunings: {
              Quiet: (
                  enabled: true,
                  group: {
                      PptPl1Spl: 55,
                      PptPl2Sppt: 65,
                      PptPl3Fppt: 65,
                  },
              ),
              Performance: (
                  enabled: false,
                  group: {},
              ),
              Balanced: (
                  enabled: false,
                  group: {},
              ),
          },
          armoury_settings: {
              NvDynamicBoost: 25,
              PanelOverdrive: 1,
              NvTempTarget: 87,
          },
      )
    '';
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
