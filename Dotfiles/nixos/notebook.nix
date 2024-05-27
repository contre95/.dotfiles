{ config, lib, pkgs, modulesPath, ... }:

{
  # Notebook custom packages
  environment.systemPackages = with pkgs; [ cowsay ];

  environment.variables = {
    MYENV = "notebook";
    MY_FOLDER = "/home/canus";
    SCR_PATH = "/home/canus/Scripts";
  };
}
