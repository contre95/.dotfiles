{ lib, ... }:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  config =
    if lib.elem whichMachine [ "desktop" ]
    then
      {
        environment.systemPackages = [
          unstable.lmstudio
        ];
        # # AI
        networking.firewall = {
          allowedTCPPorts = [
            11434
          ];
        };

        services.ollama = {
          host = "0.0.0.0";
          # models = "/home/contre/games/models";
          enable = true;
          package = unstable.ollama-cuda;
          acceleration = "cuda";
          # loadModels = [
          #   "deepseek-r1:8b"
          # ];
        };
        #
        services.open-webui = {
          enable = true;
          environment = {
            # ANONYMIZED_TELEMETRY = "False";
            # BYPASS_MODEL_ACCESS_CONTROL = "True";
            # DO_NOT_TRACK = "True";
            # HOME = ".";
            # SCARF_NO_ANALYTICS = "True";
          };
        };
      }
    else
      { };
}
