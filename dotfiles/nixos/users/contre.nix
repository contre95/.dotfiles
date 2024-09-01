{ ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  users.users.contre.isNormalUser = true;
  home-manager.useGlobalPkgs = true;
  services.dbus.enable = true;
  programs.nano.enable = false;

  environment.variables = { };

  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBwTCCAWagAwIBAgIQO/FZou+fk5O2l4PTbySTuzAKBggqhkjOPQQDAjAzMTEw
      LwYDVQQDEyhDYWRkeSBMb2NhbCBBdXRob3JpdHkgLSBFQ0MgSW50ZXJtZWRpYXRl
      MB4XDTI0MDgyOTE4NDY1N1oXDTI0MDgzMDA2NDY1N1owADBZMBMGByqGSM49AgEG
      CCqGSM49AwEHA0IABCUPBTtQhRVhYoGRkt5roI4wesUdxWznlvPeJ9XSeWu3mqzg
      sDzCrkRTPN5z7KlEQ63cYp3n8OMuT8MWsvwCGnujgY4wgYswDgYDVR0PAQH/BAQD
      AgeAMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAdBgNVHQ4EFgQUwdlt
      T6RtITm6TwXgyfQMDZwa8/cwHwYDVR0jBBgwFoAURQoHbDsS+QelWDBPlNStrBwd
      Ew4wGgYDVR0RAQH/BBAwDoIMY29udHJlLmx1Y2FzMAoGCCqGSM49BAMCA0kAMEYC
      IQCnVmyqU0JaA0HBuUaSc7xh9GEFgIum+5q5OjQd2LIJiQIhAIs0VlaMHw3K+xgW
      1SHzliOEYtJpy7J/isUth6rILw9J
      -----END CERTIFICATE-----
    ''
  ];


  # Contre
  home-manager.users.contre = { pkgs, ... }: {

    # Enable/Disable deafult system programs 
    programs.home-manager.enable = true;
    home.username = "contre";
    home.homeDirectory = "/home/contre";

    home.sessionVariables = {
      LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
      MY_FOLDER = "/home/canus";
      PASSWORD_STORE_DIR = "$MY_FOLDER/pass";
      SCR_PATH = "$MY_FOLDER/scripts";
      PATH = "$PATH:$MY_FOLDER/scripts/bin-scr:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/";
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      # Languages
      go
      jq
      cargo
      python3
      python311Packages.pip
      nodejs_22
      terraform

      # LSP and toolkits
      sqls
      black
      delve
      gopls
      mariadb
      sqlite
      pyright
      air
      mycli
      nil
      tfsec
      tflint
      terraform-ls
      nixpkgs-fmt
      yamlfmt
      marksman
      jetbrains.datagrip
      efm-langserver
      lua-language-server

      # Essentials User 
      unzip
      p7zip
      unrar
      scrcpy # To share android screen
      android-tools
      stow # To create symlinks
      bandwhich
      zoxide # Like autojump but in Rust
      awscli
      tree
      zbar # For scanning QR codes
      tree-sitter
      kubectl
      tmux
      # go-chromecast
      tmuxPlugins.tmux-thumbs
      (pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))
      tessen
      gnupg
      vlc
      cliphist
      mpv
      git
      neovim

      # Essentials OS 
      gparted
      openssl
      quickemu
      cava
      gawk
      quickgui
      xorg.xhost
      wdisplays
      less
      wl-kbptr
      openvpn
      iwgtk
      gcc
      busybox
      coreutils
      feh
      imv
      ffmpeg
      prometheus-node-exporter
      bash
      btop # Like htop which is like top
      nmap
      mpg123
      wget
      wirelesstools
      iwd
      rsync
      gnumake
      ripgrep # Like grep but in Rust
      pinentry-gnome3
      gettext

      # Desktop apps
      spotify
      betterdiscordctl
      vesktop
      (pkgs.discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      alacritty
      alacritty-theme
      telegram-desktop

      # Desktop Environment 
      pcmanfm
      dunst
      unstable.waybar
      swappy
      grim # For screenshots
      slurp # For screenshots
      bruno # Like Postman but this one has a Dog as a logo
      gnome.zenity
      wf-recorder
      hyprpaper
      librsvg
      clipman
      gammastep
      libnotify
      hyprshade
      wl-clipboard
      hyprpicker
      libsForQt5.qt5.qtwayland
      qt5.full
      wayland-utils
      wayland-protocols
      rofi-wayland
      polkit

    ];

    home.extraOutputsToInstall = [ "share/tmux-plugins" ];

    home.file = {
      neovim = {
        recursive = true;
        source = /home/canus/dotfiles/nvim;
        target = ".config/nvim";
      };

      rofi = {
        recursive = true;
        source = /home/canus/dotfiles/rofi;
        target = ".config/rofi";
      };

      tmux = {
        recursive = false;
        source = /home/canus/dotfiles/tmux/.tmux.conf;
        target = "./.tmux.conf";
      };

      wireplumber = {
        recursive = true;
        source = /home/canus/dotfiles/wireplumber;
        target = ".config/wireplumber";
      };

      waybar = {
        recursive = true;
        source = /home/canus/dotfiles/waybar;
        target = ".config/waybar";
      };

      hyprland = {
        recursive = true;
        source = /home/canus/dotfiles/hypr;
        target = ".config/hypr";
      };

      keyboard = {
        recursive = true;
        source = /home/canus/dotfiles/keybaord;
        target = ".config/xkb";
      };

      dunst = {
        recursive = true;
        source = /home/canus/dotfiles/dunst;
        target = ".config/dunst";
      };

      #  zshrc = {
      #   recursive = false;
      #   source = /home/canus/dotfiles/zsh/.zshrc;
      #   target = "./.zshrc";
      # };

      p10k = {
        recursive = false;
        source = /home/canus/dotfiles/zsh/.p10k.zsh;
        target = ".config/.p10k.zsh";
      };

      alacritty = {
        recursive = true;
        source = /home/canus/dotfiles/alacritty;
        target = ".config/alacritty";
      };

    };

    imports = [
      ../programs/gpg.nix
      ../programs/gtk.nix
      ../programs/git.nix
      ../programs/zsh.nix
      ../programs/ssh.nix
      ../programs/test.nix
      ../programs/firefox.nix
    ];

    home.stateVersion = "24.05";

  };
}



