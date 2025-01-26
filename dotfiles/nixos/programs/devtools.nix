{ pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{
  # langs, linters, formatters, lsps, etc
 home.packages = with pkgs; [
    # nix
    nil
    alejandra
    nixpkgs-fmt
    nixfmt-rfc-style
    statix

    # terraform 
    # terraform
    # terraform-ls
    # tflint
    # tfsec

    # go
    air
    unstable.go
    unstable.impl #:GoInstallDeps
    unstable.iferr #:GoInstallDeps
    unstable.gomodifytags  #:GoInstallDeps
    unstable.delve
    unstable.gopls
    unstable.gofumpt
    unstable.golines
    unstable.gotests
    unstable.gotools
    unstable.golangci-lint
    unstable.goimports-reviser
    # unstable.gdlv GUI frontend for delve

    # Dockerfile
    hadolint
    dockerfile-language-server-nodejs

    # lua
    stylua
    luarocks
    luarocks
    lua-language-server

    # FGA
    openfga-cli

    # rust
    cargo
    rustc
    # rustup
    rustfmt
    rustlings
    rust-analyzer

    # python
    mypy
    ruff
    black
    pyright
    unstable.python3
    unstable.python311Packages.pip
    # python311Packages.numpy
    # debugpy // who needs debuggers anyways

    # js
    biome
    nodePackages.jsonlint
    pkgs.nodePackages.typescript-language-server
    nodejs_23
    # js-debug-adapter

    # shell
    shfmt
    shellcheck
    shellharden
    unstable.bash-language-server

    # html/x
    html-tidy
    htmx-lsp
    vscode-langservers-extracted # for html lsp

    # sql
    # sqlite
    sqlfluff
    mycli

    # css
    # vscode-langservers-extracted # alternative?
    # css-lsp not available
    stylelint

    # c
    # clang-format # not available
    ccls
    rocmPackages_5.llvm.clang-unwrapped

    # yaml
    yamlfmt
    yaml-language-server

    # misc
    gcc
    libgcc
    nodePackages.prettier
  ];
}
