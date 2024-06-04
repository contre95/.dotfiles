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
      # # make Xbox Series X controller work
      # Class = "0x000100";
      # ControllerMode = "bredr";
      # FastConnectable = true;
      # JustWorksRepairing = "always";
      # Privacy = "device";
      Enable = "Source,Sink,Media,Socket";
      AutoEnable = true;
      ControllerMode = "bredr";
      Experimental = true;
    };
  };
}
