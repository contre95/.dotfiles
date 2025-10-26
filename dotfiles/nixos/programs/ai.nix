{
  lib,
  unstable,
  pkgs,
  hostname,
  ...
}:

{
  config =
    if
      lib.elem hostname [
        "desktop"
        "tablet"
      ]
    then
      {
        environment.systemPackages = [
          # unstable.lmstudio
        ];
        # # AI
        networking.firewall = {
          allowedTCPPorts = [
            11434
          ];
        };
        services.ollama = {
          host = "0.0.0.0";
          # models = "/home/heavy-assets/models";
          enable = true;
<<<<<<< HEAD
          package = if lib.elem hostname [ "desktop" ] then pkgs.ollama-cuda else pkgs.ollama-rocm;
          acceleration = "rocm";
=======
          package = if lib.elem hostname [ "desktop" ] then unstable.ollama-cuda else pkgs.ollama;
          # acceleration = "rocm";
>>>>>>> 2f77121011c1547ee6b60f602eedf91b76c52f04
          # loadModels = [
          # ];
        };
        #
        #   services.open-webui = {
        #     enable = true;
        #     environment = {
        #       # ANONYMIZED_TELEMETRY = "False";
        #       # BYPASS_MODEL_ACCESS_CONTROL = "True";
        #       # DO_NOT_TRACK = "True";
        #       # HOME = ".";
        #       # SCARF_NO_ANALYTICS = "True";
        #     };
        #   };
      }
    else
      { };
}
