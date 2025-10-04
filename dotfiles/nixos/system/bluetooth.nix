{
  pkgs,
  hostname,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    # blueman
    bluez
    bluez-alsa
    bluez-tools
  ];
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = hostname != "server";
  hardware.bluetooth.settings = {
    General = {
      # # make Xbox Series X controller work
      # Class = "0x000100";
      # FastConnectable = true;
      # JustWorksRepairing = "always";
      # Privacy = "device";
      # Enable = "Source,Sink,Media,Socket";
      # Enable = "Sink,Media,Socket"; # Don't enable Source since I don't want bluetooth mic to be use
      AutoEnable = true;
      ControllerMode = "dual";
      Experimental = false;
    };
  };
}
