{ pkgs, ... }:

{

  # Garbace collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

    };
  };

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
  environment.systemPackages = with pkgs; [ acpi upower brightnessctl];


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
    programs.git.signing.signByDefault = false;
    # home.packages = with pkgs; [
    # ];
  };



}
