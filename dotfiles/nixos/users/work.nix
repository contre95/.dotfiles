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
    pkgs.jq
    pkgs.cargo
    pkgs.python3
    pkgs.nodejs_22
    pkgs.terraform

    # LSP
    pkgs.sqls
    pkgs.black
    pkgs.gopls
    pkgs.pyright
    pkgs.nil
    pkgs.tfsec
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
    pkgs.unrar
    pkgs.stow
    pkgs.ripgrep
    pkgs.nerdfonts
    pkgs.bandwhich
    pkgs.autojump
    pkgs.tree
    pkgs.awscli
    pkgs.tree-sitter
    pkgs.kubectl
    pkgs.tmux
    pkgs.tmuxPlugins.tmux-thumbs
    (pkgs.pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))
    pkgs.gnupg
    pkgs.git
    pkgs.neovim
    pkgs.coreutils

    pkgs.# Desktop apps
    pkgs.alacritty


  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."lucas.contreras" = {
    imports = [
      ../programs/git.nix
    ];
    home.homeDirectory = "/Users/lucas.contreras";
  
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

#      keyboard = {
#        recursive = true;
#        source = /Users/canus/dotfiles/keybaord;
#        target = ".config/xkb";
#      };

      zshrc = {
        recursive = false;
        source = /Users/canus/dotfiles/zsh/.zshrc;
        target = "./.zshrc";
      };

      zsh = {
        recursive = false;
        source = /Users/canus/dotfiles/zsh/.zsh;
        target = "./.zsh";
      };

      alacritty = {
        recursive = true;
        source = /Users/canus/dotfiles/alacritty;
        target = ".config/alacritty";
      };

    };
  
    home.stateVersion = "24.05";
  
  };
}
