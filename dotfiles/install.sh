#!/usr/bin/env bash
echo "Remember to:
1. Create the machines/<machine_name>.nix and add machine to configuration.nixi
2. Have your GPG smart card connected.
3. Have interenet connection.i
4. nix-shell -p git gnupg vim"
sleep 3 &&
sudo rm -rf /home/canus &&
sudo mkdir /home/canus &&
sudo chown contre /home/canus &&
pushd /home/canus/ &&
gpg --import <(curl https://github.com/contre95.gpg)  &&
gpg --card-status &&
git config --global user.email lucascontre95@gmail.com
git clone https://github.com/contre95/.dotfiles.git /home/canus/ &&
git remote -v &&
git remote set-url origin git@github.com:contre95/.dotfiles.git
# Backup /etc/nixos
sudo cp /etc/nixos/hardware-configuration.nix /home/contre && \
sudo rm -rf /etc/nixos/ && sudo mkdir /etc/nixos && \
sudo find /home/canus/dotfiles/nixos/ -mindepth 1 -maxdepth 1 -exec ln -vs "{}" /etc/nixos ';'
#sudo ln -s /home/canus/dotfiles/nixos/configuration.nix /etc/nixos/configuration.nix
#sudo ln -s /home/canus/dotfiles/nixos/machines /etc/nixos/machines
#sudo ln -s /home/canus/dotfiles/nixos/programs /etc/nixos/programs
#sudo ln -s /home/canus/dotfiles/nixos/system /etc/nixos/system
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager  && \
sudo nix-channel --add https://nixos.org/channels/nixos-24.05 nixos  && \
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable  && \
cp  /home/canus/dotfiles/zsh/.p10k.zsh /home/contre/.config && \
sudo cp /home/contre/hardware-configuration.nix /etc/nixos/hardware-configuration.nix && \
sudo WHICH_MACHINE=$1 nixos-rebuild switch --upgrade
