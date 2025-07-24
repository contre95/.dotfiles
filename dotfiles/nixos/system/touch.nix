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
        services = {
          desktopManager.plasma6.enable = true;
          displayManager.sddm.enable = true;
          displayManager.sddm.wayland.enable = true;
        };

        environment.systemPackages = with pkgs; [
          kdePackages.kcalc # Calculator
          kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
          kdePackages.kcolorchooser # A small utility to select a color
          kdePackages.kolourpaint # Easy-to-use paint program
          kdePackages.ksystemlog # KDE SystemLog Application
          kdePackages.sddm-kcm # Configuration module for SDDM
          kdiff3 # Compares and merges 2 or 3 files or directories
          kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
          kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
          hardinfo2 # System information and benchmarks for Linux systems
        ];
      }
    else
      { };
}
