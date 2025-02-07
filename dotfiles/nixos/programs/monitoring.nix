{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    btop # Like htop which is like top
    prometheus-node-exporter
  ];

}
