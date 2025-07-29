{ lib, unstable, hostname, ... }:

{
  config =
    if lib.elem hostname [ "desktop" ] then
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
          package = unstable.ollama-cuda;
          acceleration = "cuda";
          loadModels = [
            "deepseek-r1:8b"
          ];
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
