{
  pkgs,
  lib,
  unstable,
  hostname,
  ...
}:

let
  commonPkgs = with pkgs; [
    unstable.rockbox-utility
    fd
    feh
    imv
    mpv
    vlc
    gawk
    less
    tmux
    tree
    wget
    iotop
    gimp3
    p7zip
    rsync
    unrar
    unzip
    ffmpeg
    mpg123
    convmv
    polkit
    smassh
    swappy
    tessen
    unstable.ghostty
    clipman
    gettext
    gparted
    pcmanfm
    ntfy-sh
    kubectl
    testdisk
    cliphist
    wl-kbptr
    alacritty
    bandwhich
    coreutils
    util-linux
    xorg.xhost
    easyeffects
    tree-sitter
    wf-recorder
    wl-clipboard
    android-tools
    yubikey-manager
    alacritty-theme
    tmuxPlugins.tmux-thumbs
    stow
    zbar
    ripgrep
    zoxide
  ];
in
{

  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;
  home-manager.extraSpecialArgs = { inherit hostname unstable; };

  programs.nano.enable = false;
  imports = [
    ../system/gnupg.nix
    ../system/openssh.nix
    ../system/touch.nix
    ../system/wg-vpn.nix
    ../system/syncthings.nix
    ../programs/steam.nix
    ../programs/ai.nix
  ];

  home-manager.users.contre =
    { pkgs, config, unstable, ... }:
    {
      wayland.windowManager.hyprland.systemd.enable = false;
      programs.home-manager.enable = true;
      home.username = "contre";
      home.homeDirectory = "/home/contre";
      home.sessionVariables = {
        MY_FOLDER = "/home/canus";
        SCR_PATH = "$MY_FOLDER/scripts";
        PATH = "$PATH:$MY_FOLDER/scripts/bin-scr:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/:$HOME/.cargo/bin";
        EDITOR = "nvim";
      };

      home.packages =
        if "${hostname}" == "desktop" then
          commonPkgs
          ++ [
            pkgs.lingot
            pkgs.picard
            pkgs.scrcpy
            pkgs.blender
            unstable.telegram-desktop
          ]
        else if "${hostname}" == "notebook" then
          commonPkgs
          ++ [
            pkgs.slack
            pkgs.lingot
            pkgs.scrcpy
            pkgs.blender
            pkgs.spotify
            pkgs.telegram-desktop
          ]
        else if "${hostname}" == "tablet" then
          commonPkgs
          ++ [
            pkgs.krita
            pkgs.picard
            pkgs.slack
            pkgs.lingot
            pkgs.spotify
            unstable.telegram-desktop
          ]
        else if "${hostname}" == "server" then
          commonPkgs
          ++ [
            pkgs.picard
            pkgs.beets
          ]
        else
          commonPkgs ++ [ ];

      imports = [
        ../programs/git.nix
        ../programs/gpg.nix
        ../programs/gtk.nix
        ../programs/obs.nix
        ../programs/ssh.nix
        ../programs/zsh.nix
        ../programs/pass.nix
        ../programs/test.nix
        ../programs/discord.nix
        ../programs/slicer.nix
        ../programs/librewolf.nix
        ../programs/devtools.nix
      ];

      home.extraOutputsToInstall = [ "share/tmux-plugins" ];
      home.file = {
        librewolf = {
          target = ".librewolf/default/chrome";
          source = pkgs.fetchzip {
            url = "https://github.com/datguypiko/Firefox-Mod-Blur/archive/refs/heads/master.zip";
            hash = "sha256-Lm6B9aYZO0JiUDiwD5WEDhOzgwxt3c1RF3NUpikyR3Y=";
          };
        };
        neovim = {
          recursive = true;
          target = ".config/nvim";
          source = config.lib.file.mkOutOfStoreSymlink ../../nvim;
        };
        rofi = {
          recursive = true;
          target = ".config/rofi";
          source = ../../rofi;
        };
        tmux = {
          recursive = false;
          target = "./.tmux.conf";
          source = config.lib.file.mkOutOfStoreSymlink ../../tmux/.tmux.conf;
        };
        wireplumber = {
          recursive = true;
          target = ".config/wireplumber";
          source = ../../wireplumber;
        };
        waybar = {
          recursive = true;
          target = ".config/waybar";
          source = config.lib.file.mkOutOfStoreSymlink ../../waybar;
        };
        hyprland = {
          recursive = true;
          target = ".config/hypr";
          source = config.lib.file.mkOutOfStoreSymlink ../../hypr;
        };
        keyboard = {
          recursive = true;
          target = ".config/xkb";
          source = ../../keybaord;
        };
        dunst = {
          recursive = true;
          target = ".config/dunst";
          source = ../../dunst;
        };
        p10k = {
          recursive = false;
          target = ".config/.p10k.zsh";
          source = ../../zsh/.p10k.zsh;
        };
        alacritty = {
          enable = true;
          target = ".config/alacritty";
          source = config.lib.file.mkOutOfStoreSymlink ../../alacritty;
        };
        drawer = {
          enable = true;
          target = ".config/nwg-drawer";
          source = config.lib.file.mkOutOfStoreSymlink ../../nwg-drawer;
        };
        ghostty = {
          enable = true;
          target = ".config/ghostty";
          source = config.lib.file.mkOutOfStoreSymlink ../../ghostty;
        };
        # lanmouse = {
        #   recursive = false;
        #   target = ".config/lan-mouse";
        #   source = config.lib.file.mkOutOfStoreSymlink ../lan-mouse/${hostname};
        # };
      };
      home.stateVersion = "25.05";
    };
}
