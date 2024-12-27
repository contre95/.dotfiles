{ config, pkgs, ... }:

let
  ghostty = import (builtins.fetchGit {
    url = "https://github.com/ghostty-org/ghostty";
    rev = "main";  # Or any specific commit you want to use
  }).nix;
in {
  environment.systemPackages = with pkgs; [
    ghostty
  ];
}

