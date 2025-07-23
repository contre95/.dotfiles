{ lib, pkgs, ... }:
let
  whichMachine = builtins.getEnv "WHICH_MACHINE";
  unstable = import <nixos-unstable> {
    config = {
      allowUnfree = true;
    };
  };
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
    grimblast
    util-linux
    xorg.xhost
    easyeffects
    tree-sitter
    wf-recorder
    wl-clipboard
    android-tools
    yubikey-manager
    alacritty-theme
    unstable.hyprpicker
    grim # For screenshots
    slurp # For screenshots
    tmuxPlugins.tmux-thumbs
    stow # To create symlinks
    zbar # For scanning QR codes
    ripgrep # Like grep but in Rust
    zoxide # Like autojump but in Rust
  ];
in
{
  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;

  # System programs
  programs.nano.enable = false;
  imports =
    [
      ../system/gnupg.nix
      ../system/openssh.nix
      ../system/syncthings.nix
      ../programs/steam.nix
      ../programs/ai.nix
    ]
    ++ (
      if
        lib.elem whichMachine [
          "notebook"
          "tablet"
        ]
      then
        [ ../system/wg-vpn.nix ]
      else
        [ ]
    );
  # Home manager
  home-manager.users.contre =
    { pkgs, config, ... }:
    {
      wayland.windowManager.hyprland.systemd.enable = false;
      programs.home-manager.enable = true;
      home.username = "contre";
      home.homeDirectory = "/home/contre";
      home.sessionVariables = {
        MY_FOLDER = "/home/canus";
        # LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
        SCR_PATH = "$MY_FOLDER/scripts";
        PATH = "$PATH:$MY_FOLDER/scripts/bin-scr:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/:$HOME/.cargo/bin";
        EDITOR = "nvim";
      };
      home.packages =
        if "${whichMachine}" == "desktop" then
          commonPkgs
          ++ [
            pkgs.lingot
            pkgs.picard
            pkgs.scrcpy
            pkgs.blender
            unstable.telegram-desktop
          ]
        else if "${whichMachine}" == "notebook" then
          commonPkgs
          ++ [
            pkgs.slack
            pkgs.lingot
            pkgs.scrcpy
            pkgs.blender
            pkgs.spotify
            pkgs.telegram-desktop
          ]
        else if "${whichMachine}" == "tablet" then
          commonPkgs
          ++ [
            pkgs.krita
            pkgs.slack
            pkgs.lingot
            pkgs.spotify
            pkgs.telegram-desktop
          ]
        else if "${whichMachine}" == "server" then
          commonPkgs
          ++ [
            pkgs.picard
            pkgs.beets
          ]
        else
          commonPkgs [ ];

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
            # stripRoot = false;
          };
        };
        neovim = {
          recursive = true;
          target = ".config/nvim";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/nvim;
        };
        rofi = {
          recursive = true;
          target = ".config/rofi";
          source = /home/canus/dotfiles/rofi;
        };
        tmux = {
          recursive = false;
          target = "./.tmux.conf";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/tmux/.tmux.conf;
        };
        wireplumber = {
          recursive = true;
          target = ".config/wireplumber";
          source = /home/canus/dotfiles/wireplumber;
        };
        waybar = {
          recursive = true;
          target = ".config/waybar";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/waybar;
        };
        hyprland = {
          recursive = true;
          target = ".config/hypr";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/hypr;
        };
        keyboard = {
          recursive = true;
          target = ".config/xkb";
          source = /home/canus/dotfiles/keybaord;
        };
        dunst = {
          recursive = true;
          target = ".config/dunst";
          source = /home/canus/dotfiles/dunst;
        };
        p10k = {
          recursive = false;
          target = ".config/.p10k.zsh";
          source = /home/canus/dotfiles/zsh/.p10k.zsh;
        };
        alacritty = {
          # recursive = true;
          enable = true;
          target = ".config/alacritty";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/alacritty;
        };
        ghostty = {
          # recursive = true;
          enable = true;
          target = ".config/ghostty";
          source = config.lib.file.mkOutOfStoreSymlink /home/canus/dotfiles/ghostty;
        };
      };
      home.stateVersion = "25.05";
    };
}
