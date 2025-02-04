{ ... }:
let
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
in
{
  # # AI
  services.ollama = {
    models = "/home/contre/games/Podman";
    enable = true;
    package = unstable.ollama-cuda;
    acceleration = "cuda";
    loadModels = [
      "deepseek-r1:8b"
    ];
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
