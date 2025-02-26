{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # blueman
    bluez
    bluez5-experimental
  ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      # # make Xbox Series X controller work
      # Class = "0x000100";
      # FastConnectable = true;
      # JustWorksRepairing = "always";
      # Privacy = "device";
      # Enable = "Source,Sink,Media,Socket";
      Enable = "Sink,Media,Socket"; # Don't enable Source since I don't want bluetooth mic to be use
      AutoEnable = true;
      ControllerMode = "dual";
      Experimental = true;
    };
  };
}
