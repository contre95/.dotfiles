{ config, pkgs, ... }:
let
  dotfiles = "/home/canus/dotfiles";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  # ".librewolf/default/chrome".source = config.lib.file.mkOutOfStoreSymlink (
  #   builtins.fetchzip {
  #     url = "https://github.com/datguypiko/Firefox-Mod-Blur/archive/refs/heads/master.zip";
  #     hash = "sha256-Lm6B9aYZO0JiUDiwD5WEDhOzgwxt3c1RF3NUpikyR3Y=";
  #   }
  # );
# ".librewolf/default/chrome".source = config.lib.file.mkOutOfStoreSymlink (
#    pkgs.fetchFromGitHub {
#      owner = "datguypiko";
#      repo = "Firefox-Mod-Blur";
#      rev = "master";
#      sha256 = "sha256-W82y0qKR8yPdS6Fj6Ngw07qdNmswD7Od73qbc0x0gPE=";
#    }
#  );

  ".config/nvim".source = symlink "${dotfiles}/nvim";
  ".config/rofi".source = symlink "${dotfiles}/rofi";
  ".tmux.conf".source = symlink "${dotfiles}/tmux/.tmux.conf";
  ".config/wireplumber".source = symlink "${dotfiles}/wireplumber";
  ".config/waybar".source = symlink "${dotfiles}/waybar";
  ".config/hypr".source = symlink "${dotfiles}/hypr";
  ".config/xkb".source = symlink "${dotfiles}/keybaord";
  ".config/dunst".source = symlink "${dotfiles}/dunst";
  ".config/.p10k.zsh".source = symlink "${dotfiles}/zsh/.p10k.zsh";
  ".config/alacritty".source = symlink "${dotfiles}/alacritty";
  ".config/nwg-drawer".source = symlink "${dotfiles}/nwg-drawer";
  ".config/ghostty".source = symlink "${dotfiles}/ghostty";
  ".moc/config".source = symlink "${dotfiles}/moc/config";

  # Uncomment and customize the hostname if needed
  # ".config/lan-mouse".source = symlink ../lan-mouse/${hostname};
}
