{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    wireplumber
    pipewire
    pamixer
    pavucontrol
    pw-volume
  ];

  sound.enable = true;

  services.pipewire = {
    systemWide = false;
    audio.enable = true;
    enable = true;
    alsa.enable = true;
    socketActivation = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa.support32Bit = true;
    # 24.05
    extraConfig.pipewire-pulse."92-low-latency" = {
      context.modules = [
        {
          name = "libpipewire-module-protocol-pulse";
          args = {
            pulse.min.req = "32/48000";
            pulse.default.req = "32/48000";
            pulse.max.req = "32/48000";
            pulse.min.quantum = "32/48000";
            pulse.max.quantum = "32/48000";
          };
        }
      ];
      stream.properties = {
        node.latency = "32/48000";
        resample.quality = 1;
      };
    };

    # Bluetooth
    wireplumber.extraConfig = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.auto-connect" = [ "hfp_hf" "hsp_hs" "a2dp_sink" "hfp_ag" "hsp_ag"];
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "a2dp_sink" "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
      };
    };

  };

  # Bluetooth config
  # environment.etc = {
  #   "wireplumber/bluetooth.lua.d/51-bluez-config.lua".text = ''
  #     		bluez_monitor.properties = {
  #     			["bluez5.enable-sbc-xq"] = true,
  #     			["bluez5.enable-msbc"] = true,
  #     			["bluez5.enable-hw-volume"] = true,
  #     			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
  #     		}
  #     	'';
  # };
}
