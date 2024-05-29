{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    # blueman
    bluez
    bluez5-experimental
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
}
