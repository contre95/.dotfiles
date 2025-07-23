{ lib, pkgs, ... }:
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
    if
      lib.elem whichMachine [
        "tablet"
      ]
    then
      {
        services.xserver = {
          xkb = {
            layout = "us";
            variant = "";
          };
          enable = true;
          desktopManager.gnome.enable = true;
          displayManager.gdm.enable = true;
          displayManager.gdm.wayland = true;
        };
        environment.gnome.excludePackages = (
          with pkgs;
          [
            atomix # puzzle game
            cheese # webcam tool
            epiphany # web browser
            evince # document viewer
            geary # email reader
            gedit # text editor
            gnome-characters
            gnome-music
            gnome-photos
            gnome-terminal
            gnome-tour
            hitori # sudoku game
            iagno # go game
            tali # poker game
            totem # video player
          ]
        );

      }
    else
      { };
}
