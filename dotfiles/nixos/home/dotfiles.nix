{ config, pkgs, ... }:
let
  dotfiles = "/home/canus/dotfiles";
  symlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  ".librewolf/default/chrome".source = config.lib.file.mkOutOfStoreSymlink (
    pkgs.fetchzip {
      url = "https://github.com/datguypiko/Firefox-Mod-Blur/archive/refs/heads/master.zip";
      hash = "sha256-YcADnfZSs4Tv99NHyvwip8sE6tXh5sQHj/SXgC/Nxc4=";
    }
  );

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
