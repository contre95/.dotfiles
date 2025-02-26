{ config, pkgs, ... }:
let
  mod = "alt";
in
{
  imports = [ <home-manager/nix-darwin> ];

  environment = {
    shells = with pkgs; [ zsh ];
    darwinConfig = "/Users/canus/dotfiles/nixos/configuration.nix";
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
    services.aerospace = {
      enable = true;

      settings = {
        default-root-container-layout = "tiles";
        after-startup-command = [ "layout tiles" ];

        gaps = {
          inner.horizontal = 8;
          inner.vertical = 8;
          outer.left = 7;
          outer.bottom = 7;
          outer.top = 7;
          outer.right = 7;
        };

        # https://github.com/pop-os/cosmic-comp/blob/master/data/keybindings.ron
        mode.main.binding = {
          "${mod}-g" = ''
            exec-and-forget open -b "com.google.Chrome"
          '';

          "${mod}-enter" = ''
            exec-and-forget open -b "/System/Applications/Utilities/Terminal.app"
          '';

          "${mod}-j" = "focus left";
          "${mod}-k" = "focus down";
          "${mod}-i" = "focus up";
          "${mod}-l" = "focus right";

          "${mod}-up" = "focus up";
          "${mod}-down" = "focus down";
          "${mod}-left" = "focus left";
          "${mod}-right" = "focus right";

          "${mod}-shift-j" = "move left";
          "${mod}-shift-k" = "move down";
          "${mod}-shift-i" = "move up";
          "${mod}-shift-l" = "move right";

          "${mod}-shift-up" = "move up";
          "${mod}-shift-down" = "move down";
          "${mod}-shift-left" = "move left";
          "${mod}-shift-right" = "move right";

          # Toggle layouts
          "${mod}-q" = "close";
          "${mod}-s" = "layout accordion tiles";
          "${mod}-o" = "layout horizontal vertical";
          "${mod}-y" = "layout tiles accordion";
          "${mod}-shift-f" = "layout tiling floating";
          # https://github.com/nikitabobko/AeroSpace/issues/8
          # "${meh}-x" = "swap";

          "${mod}-f" = "fullscreen";

          "${mod}-1" = "workspace 1";
          "${mod}-2" = "workspace 2";
          "${mod}-3" = "workspace 3";
          "${mod}-4" = "workspace 4";
          "${mod}-5" = "workspace 5";
          "${mod}-6" = "workspace 6";
          "${mod}-7" = "workspace 7";
          "${mod}-8" = "workspace 8";
          "${mod}-9" = "workspace 9";
          "${mod}-0" = "workspace 10";

          "${mod}-shift-1" = [ "move-node-to-workspace 1" "workspace 1" ];
          "${mod}-shift-2" = [ "move-node-to-workspace 2" "workspace 2" ];
          "${mod}-shift-3" = [ "move-node-to-workspace 3" "workspace 3" ];
          "${mod}-shift-4" = [ "move-node-to-workspace 4" "workspace 4" ];
          "${mod}-shift-5" = [ "move-node-to-workspace 5" "workspace 5" ];
          "${mod}-shift-6" = [ "move-node-to-workspace 6" "workspace 6" ];
          "${mod}-shift-7" = [ "move-node-to-workspace 7" "workspace 7" ];
          "${mod}-shift-8" = [ "move-node-to-workspace 8" "workspace 8" ];
          "${mod}-shift-9" = [ "move-node-to-workspace 9" "workspace 9" ];
          "${mod}-shift-0" = [ "move-node-to-workspace 10" "workspace 10" ];

          "${mod}-shift-c" = "reload-config";
          "${mod}-r" = "mode resize";
        };

        # mode.resize.binding = {
        #   h = "resize width -50";
        #   j = "resize height +50";
        #   k = "resize height -50";
        #   l = "resize width +50";
        #
        #   left = "resize width -50";
        #   down = "resize height +50";
        #   up = "resize height -50";
        #   right = "resize width +50";
        #
        #   enter = "mode main";
        #   esc = "mode main";
        # };

        # on-window-detected = [
        #   {
        #     "if".app-name-regex-substring = "chrome|firefox|safari";
        #     run = [ "move-node-to-workspace 1" ];
        #   }
        #
        #   {
        #     "if".app-name-regex-substring = "code|wezterm|ghostty|terminal";
        #     run = [ "move-node-to-workspace 2" ];
        #   }
        #
        #   {
        #     "if".app-name-regex-substring = "obsidian|slack";
        #     run = [ "move-node-to-workspace 3" ];
        #   }
        #
        #   {
        #     "if".app-name-regex-substring = "zoom";
        #     run = [ "move-node-to-workspace 10" ];
        #   }
        # ];
      };
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
    pkgs.luarocks

    # Essentials User
    pkgs.unzip
    pkgs.direnv
    pkgs.unrar
    pkgs.stow
    pkgs.ripgrep
    pkgs.nerd-fonts._0xproto
    pkgs.nerd-fonts.droid-sans-mono
    pkgs.bandwhich
    pkgs.zoxide
    pkgs.tree
    pkgs.openvpn
    pkgs.awscli
    pkgs.azure-cli
    pkgs.openssl
    pkgs.tree-sitter
    pkgs.kubectl
    pkgs.tmux
    pkgs.tmuxPlugins.tmux-thumbs
    pkgs.neovim
    pkgs.coreutils

    pkgs.alacritty
    pkgs.alacritty-theme

  ];
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  ids.uids.nixbld = 350;
  home-manager.users."lucas.contreras" = {

    home.homeDirectory = "/Users/lucas.contreras";

    home.sessionVariables = {
      MY_FOLDER = "/Users/canus";
      # PASSWORD_STORE_DIR = "$MY_FOLDER/pass";
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
      ../programs/pass.nix
      # ../programs/git.nix
      ../programs/zsh.nix
    ];

    home.stateVersion = "24.11";

  };
}
