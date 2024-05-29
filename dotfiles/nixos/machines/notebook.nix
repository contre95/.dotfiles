{ config, lib, pkgs, modulesPath, home-manager, ... }:

{
  # Environment Packages
  environment.systemPackages = with pkgs; [ ];

  # # User specific
  # home-manager.users.contre = { pkgs, ... }: {
  #   home.packages = with pkgs; [
  #   ];
  # };

  environment.variables = {
    MYENV = "notebook";
    MY_FOLDER = "/home/canus";
    SCR_PATH = "/home/canus/scripts";
  };
}
