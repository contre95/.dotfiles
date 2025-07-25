
# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

check_command() {
  command -v "$1" >/dev/null 2>&1
}

missing_tools=()

for tool in git gpg nvim; do
  if ! check_command "$tool"; then
    missing_tools+=("$tool")
  fi
done


if [ ${#missing_tools[@]} -ne 0 ]; then
  echo -e "${RED}Error:${NC} The following required tools are missing: ${missing_tools[*]}"
  echo -e "${YELLOW}To install them with nix-shell, run:${NC}"
  echo -e "  nix-shell -p gnupg git neovim"
  exit 1
fi


echo -e "${CYAN}
Remember to:
1. Create the machines/<machine_name>.nix and add machine to configuration.nix
2. Have your GPG smart card connected.
3. Have internet connection
${NC}"

echo -e "${YELLOW}Please run this script like this -> bash <(curl -fsSL https://nixos.contre.io/)${NC}"

read -rp "$(echo -e "${YELLOW}Enter machine name: ${NC}")" MACHINE &&

# Confirm
echo -e "${CYAN}You entered: '${MACHINE}'${NC}"
read -rp "$(echo -e "${YELLOW}Is this correct? [y/N] ${NC}")" CONFIRM
if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
  echo -e "${RED}Aborting. Please run the script again and enter the correct machine name.${NC}"
  exit 1
fi


echo -e "${GREEN}Cleaning up environment for machine: $MACHINE${NC}"
sudo cp /etc/nixos/hardware-configuration.nix /home/contre/ &&
sudo rm -rf /etc/nixos/* &&
sudo cp /home/contre/hardware-configuration.nix /etc/nixos/hardware-configuration.nix &&

echo -e "${CYAN}Preparing /home/canus...${NC}"
sudo rm -rf /home/canus &&
sudo mkdir /home/canus &&
sudo chown contre /home/canus &&

pushd /home/canus/ || exit

echo -e "${CYAN}Importing GPG key...${NC}"
gpg --import <(curl https://github.com/contre95.gpg) &&
gpg --card-status &&

echo -e "${CYAN}Setting Git configuration...${NC}"
git config --global user.email lucascontre95@gmail.com

echo -e "${CYAN}Cloning dotfiles...${NC}"
git clone https://github.com/contre95/.dotfiles.git /home/canus/ &&

git remote -v
git remote set-url origin git@github.com:contre95/.dotfiles.git

echo -e "${CYAN}Backing up and linking NixOS configurations...${NC}"
sudo cp /etc/nixos/hardware-configuration.nix /home/contre/hardware-configuration.nix.bkp &&
sudo find /home/canus/dotfiles/nixos/ -mindepth 1 -maxdepth 1 -exec ln -vs "{}" /etc/nixos ';'

echo -e "${CYAN}Adding Nix channels...${NC}"
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz home-manager &&
sudo nix-channel --add https://nixos.org/channels/nixos-25.05 nixos &&
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable &&
sudo nix-channel --update

echo -e "${GREEN}Rebuilding system configuration for machine: $MACHINE...${NC}"
sudo WHICH_MACHINE="$MACHINE" nixos-rebuild switch --upgrade

echo -e "${GREEN}Setup complete.${NC}"

