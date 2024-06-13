{ pkgs, ... }: {

  imports = [ <home-manager/nix-darwin> ];
    home-manager.users.contre = {
    home.packages = [  ];
      };

   home = {
    username = "rich";
    homeDirectory = "/Users/rich";
    packages = with pkgs; [
      # Languages
      go
      jq
      cargo
      python3
      nodejs_22
      terraform

      # LSP
      sqls
      black
      gopls
      pyright
      nil
      tfsec
      tflint
      terraform-ls
      nixpkgs-fmt
      yamlfmt
      marksman
      efm-langserver
      lua-language-server

      # Essentials User 
      unzip
      unrar
      stow
      bandwhich
      autojump
      awscli
      tree
      zbar
      tree-sitter
      kubectl
      tmux
      tmuxPlugins.tmux-thumbs
      (pass.withExtensions (ext: with ext; [ pass-checkup pass-otp ]))
      gnupg
      mpv
      git
      neovim

      # Desktop apps
      alacritty

    ];

  environment = {
    shells = with pkgs; [ zsh ];
    darwinConfig = "/Users/contre/dotfiles/nixos/configuration.nix";
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

};
}
