{ config, pkgs, ... }:
{
  imports = [ <home-manager/nix-darwin> ];

  environment = {
    shells = with pkgs; [ zsh ];
    darwinConfig = "/Users/canus/dotfiles/nixos/configuration.nix";
    loginShell = pkgs.zsh;
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  environment.systemPackages = [
    # Languages
    pkgs.go
    # pkgs.protobuf_26
    pkgs.protoc-gen-go
    pkgs.protoc-gen-go-grpc
    pkgs.grpc-gateway
    # pkgs.grpc-tools
    pkgs.jq
    pkgs.cargo
    pkgs.python3
    pkgs.nodejs_22
    pkgs.terraform
    pkgs.terraform-docs
    pkgs.terragrunt

    # LSP
    pkgs.sqls
    pkgs.black
    pkgs.gopls
    pkgs.pyright
    pkgs.nil
    pkgs.tfsec
    pkgs.zoxide
    pkgs.tflint
    pkgs.terraform-ls
    pkgs.nixpkgs-fmt
    pkgs.bruno
    pkgs.rectangle
    pkgs.yamlfmt
    pkgs.marksman
    pkgs.efm-langserver
    pkgs.lua-language-server

    # Essentials User 
    pkgs.unzip
    pkgs.direnv
    pkgs.unrar
    pkgs.stow
    pkgs.ripgrep
    pkgs.nerdfonts
    pkgs.bandwhich
    pkgs.zoxide
    pkgs.tree
    pkgs.awscli
    pkgs.azure-cli
    pkgs.tree-sitter
    pkgs.kubectl
    pkgs.tmux
    pkgs.tmuxPlugins.tmux-thumbs
    (pkgs.pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))
    pkgs.gnupg
    pkgs.git
    pkgs.neovim
    pkgs.coreutils

    pkgs.# Web apps
    pkgs.yarr 

    pkgs.# Desktop apps
    pkgs.alacritty
    pkgs.alacritty-theme


  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."lucas.contreras" = {

    home.homeDirectory = "/Users/lucas.contreras";

    home.sessionVariables = {
      MY_FOLDER = "/Users/canus";
      PASSWORD_STORE_DIR = "$MY_FOLDER/pass";
      PATH = "$PATH:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/:/usr/local/bin";
      NIX_PATH = "/Users/lucas.contreras/.nix-defexpr/channels:darwin-config=/Users/canus/dotfiles/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
      SCR_PATH = "$MY_FOLDER/scripts";
      EDITOR = "nvim";
    };

    home = {
      packages = [
      ];
    };

    home.file = {
      neovim = {
        recursive = true;
        source = /Users/canus/dotfiles/nvim;
        target = ".config/nvim";
      };

      tmux = {
        recursive = false;
        source = /Users/canus/dotfiles/tmux/.tmux.conf;
        target = "./.tmux.conf";
      };

      p10k = {
        recursive = false;
        source = /Users/canus/dotfiles/zsh/.p10k.zsh;
        target = ".config/.p10k.zsh";
      };

      alacritty = {
        recursive = true;
        source = /Users/canus/dotfiles/alacritty;
        target = ".config/alacritty";
      };

    };

    # These imports uses the files linked above
    imports = [
      ../programs/git.nix
      ../programs/zsh.nix
    ];


    home.stateVersion = "24.05";

  };
}
