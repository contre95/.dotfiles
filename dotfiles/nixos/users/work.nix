{ config, pkgs, ... }:
{
  # imports = [ <home-manager/nix-darwin> ];

  environment = {
    shells = with pkgs; [ zsh ];
    darwinConfig = "/Users/contre/dotfiles/nixos/configuration.nix";
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
    pkgs.bandwhich
    pkgs.autojump
    pkgs.tree
    pkgs.awscli
    pkgs.zbar
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
  # home-manager.useGlobalPkgs = true;
  # home-manager.useUserPackages = true;
  # home-manager.users.contre = {
  #   home.username = "contre";
  #   home.homeDirectory = "/Users/contre";
  #
  #   home = {
  #     # username = "contre";
  #     # homeDirectory = "/Users/contre";
  #     packages = [
  #     ];
  #   };
  #
  #   home.stateVersion = "24.05";
  #
  # };
}
