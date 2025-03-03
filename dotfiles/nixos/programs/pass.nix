{ pkgs,config, ... }:
{
  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "$MY_FOLDER/pass/";
    };

    package = pkgs.pass.withExtensions (
      ext: with ext; [
        pass-checkup
        pass-otp
      ]
    );
  };

  # Interesting thing that you can use pass as a secret service
  # https://specifications.freedesktop.org/secret-service-spec/latest/
  # https://wiki.nixos.org/wiki/Secret_Service
  #
  # services.pass-secret-service = {
  #   enable = true;
  #   storePath = "$MY_FOLDER/pass/";
  #   extraArgs = [ "-e${config.programs.password-store.package}/bin/pass" ];
  # };

}
