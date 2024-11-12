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

  # This will give you the intermediate.crt
  # curl --insecure https://<your-stie> -w "%{certs}" -o /dev/null  > asd
  security.pki.certificates = [
    ''
      -----BEGIN CERTIFICATE-----
      MIIBpDCCAUqgAwIBAgIRAIHxoPlrvKIDe2p9xa4JyVAwCgYIKoZIzj0EAwIwMDEu
      MCwGA1UEAxMlQ2FkZHkgTG9jYWwgQXV0aG9yaXR5IC0gMjAyNCBFQ0MgUm9vdDAe
      Fw0yNDA5MDgwMjEyMDFaFw0zNDA3MTgwMjEyMDFaMDAxLjAsBgNVBAMTJUNhZGR5
      IExvY2FsIEF1dGhvcml0eSAtIDIwMjQgRUNDIFJvb3QwWTATBgcqhkjOPQIBBggq
      hkjOPQMBBwNCAATlRudHbyrrHsbPlieQn9Jsm+3E1rTx8seoqroC4zAnuvT1Rnkz
      bkHYoH5Yqm+U88oFFvv9UazN1rYfQi3DGPOSo0UwQzAOBgNVHQ8BAf8EBAMCAQYw
      EgYDVR0TAQH/BAgwBgEB/wIBATAdBgNVHQ4EFgQUFxGMp2jlbhs4gCNrCztlXbJi
      QekwCgYIKoZIzj0EAwIDSAAwRQIhAKXqTdwu1KlegREvKWOWbNKstmwgADfwSwno
      KBzRe5FJAiAgGVlng9FDrihC4oImL9o8VQ1tUAf8GCdPxL4bCtc7MQ==
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
      nodejs_22
      terraform
      python311Packages.pip

      # LSP and toolkits (Also NVIM LPS)
      unstable.neovim
      air
      nil
      sqls
      black
      delve
      golangci-lint-langserver
      gosec
      golangci-lint
      gopls
      mycli
      tfsec
      sqlite
      tflint
      mariadb
      pyright
      yamlfmt
      htmx-lsp
      marksman
      easyeffects
      nixpkgs-fmt
      terraform-ls
      efm-langserver
      lua-language-server
      # jetbrains.datagrip

      # Essentials User 
      git
      mpv
      vlc
      tmux
      tree
      gnupg
      p7zip
      unrar
      unzip
      awscli
      ollama
      tessen
      kubectl
      cliphist
      bandwhich
      tree-sitter
      android-tools
      # go-chromecast
      tmuxPlugins.tmux-thumbs
      stow # To create symlinks
      zbar # For scanning QR codes
      scrcpy # To share android screen
      zoxide # Like autojump but in Rust
      (pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))

      # Essentials OS 
      dig
      feh
      gcc
      imv
      iwd
      bash
      cava
      gawk
      hugo
      less
      wget
      iwgtk
      rsync
      ffmpeg
      mpg123
      busybox
      gettext
      gnumake
      gparted
      openssl
      openvpn
      sshpass
      quickemu
      quickgui
      wl-kbptr
      coreutils
      wdisplays
      wireshark
      xorg.xhost
      speedtest-cli
      wirelesstools
      pinentry-gnome3
      prometheus-node-exporter
      ripgrep # Like grep but in Rust
      btop # Like htop which is like top

      # Desktop apps
      spotify
      vesktop
      alacritty
      alacritty-theme
      betterdiscordctl
      telegram-desktop
      # yubikey-manager
      simplex-chat-desktop
      # picard # Excelent software to organize music
      (pkgs.discord.override { withOpenASAR = true; withVencord = true; })

      # Desktop Environment 
      dunst
      polkit
      swappy
      clipman
      librsvg
      pcmanfm
      qt5.full
      gammastep
      hyprpaper
      hyprshade
      libnotify
      hyprpicker
      wf-recorder
      gnome.zenity
      rofi-wayland
      wl-clipboard
      wayland-utils
      unstable.waybar
      wayland-protocols
      grim # For screenshots
      slurp # For screenshots
      libsForQt5.qt5.qtwayland
      # bruno # Like Postman but this one has a Dog as a logo
    ];

    home.extraOutputsToInstall = [ "share/tmux-plugins" ];
    home.file = {
      neovim = {
        recursive = true;
        target = ".config/nvim";
        source = /home/canus/dotfiles/nvim;
      };
      rofi = {
        recursive = true;
        target = ".config/rofi";
        source = /home/canus/dotfiles/rofi;
      };
      tmux = {
        recursive = false;
        target = "./.tmux.conf";
        source = /home/canus/dotfiles/tmux/.tmux.conf;
      };
      wireplumber = {
        recursive = true;
        target = ".config/wireplumber";
        source = /home/canus/dotfiles/wireplumber;
      };
      waybar = {
        recursive = true;
        target = ".config/waybar";
        source = /home/canus/dotfiles/waybar;
      };
      hyprland = {
        recursive = true;
        target = ".config/hypr";
        source = /home/canus/dotfiles/hypr;
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
        recursive = true;
        target = ".config/alacritty";
        source = /home/canus/dotfiles/alacritty;
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



