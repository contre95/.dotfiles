#!/usr/bin/env bash
nix-shell -p gpg git 
sudo mkdir /home/canus
sudo chown contre /home/canus
pushd /home/canus/
gpg --import  ./nixos/contre.pub
gpg --card-status
git clone git@github.com/contre95/.dotfiles.git /home/canus/
# Backup /etc/nixos
sudo cp /etc/nixos/hardware-configuration.nix /home/contre
sudo cp /etc/nixos/hardware-configuration.nix /home/contre
# Rebiuld /etc/nixos
sudo rm -rf /etc/nixos/
sudo ln -s /etc/nixos/ /home/canus/dotfiles/nixos/
# Update Channels
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager 
sudo nix-channel --add https://nixos.org/channels/nixos-24.05 nixos 
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable 
# Prepare and run 
cp  ./zsh/p10k.zsh /home/contre/.config
