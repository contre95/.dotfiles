{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nur.url = "github:nix-community/NUR";
    # Optional: Add other flake inputs you might need
    # hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      # Common configuration shared across all machines
      commonModules = [
        ./dotfiles/nixos/home/contre.nix
        ./dotfiles/nixos/system/boot.nix
        ./dotfiles/nixos/system/test.nix
        ./dotfiles/nixos/system/fonts.nix
        ./dotfiles/nixos/system/shell.nix
        ./dotfiles/nixos/system/audio.nix
        ./dotfiles/nixos/system/version.nix
        ./dotfiles/nixos/system/graphics.nix
        ./dotfiles/nixos/system/security.nix
        ./dotfiles/nixos/system/bluetooth.nix
        ./dotfiles/nixos/system/containers.nix
        ./dotfiles/nixos/system/networking.nix
        ./dotfiles/nixos/system/monitoring.nix
        home-manager.nixosModules.home-manager
        {
          # Allow unfree packages globally
          nixpkgs.config.allowUnfree = true;

          # Home Manager configuration
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
          };

          # Enable flakes system-wide
          nix.settings.experimental-features = [
            "nix-command"
            "flakes"
          ];

          # Common environment variables
          environment.variables = {
            PAGER = "";
            EDITOR = "nvim";
            KEYTIMEOUT = "10";
            NIXOS_OZONE_WL = "1";
            LANG = "en_US.UTF-8";
            LC_ALL = "en_US.UTF-8";
            XDG_SESSION_TYPE = "wayland";
          };

          # Set time zone
          time.timeZone = "Europe/Madrid";

          # Define user account
          users.users.contre = {
            uid = 1000;
            shell = nixpkgs.legacyPackages.${system}.zsh;
            isNormalUser = true;
            extraGroups = [
              "wheel"
              "video"
              "dialout"
              "kvm"
              "adbusers"
            ];
          };
        }
      ];

      # Function to create a system configuration
      mkSystem =
        {
          hostname,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs;
            unstable = nixpkgs-unstable.legacyPackages.${system};
            hostname = hostname;
          };
          modules =
            commonModules
            ++ extraModules
            ++ [
              {
                networking.hostName = hostname;
                environment.variables.MYENV = hostname;
                environment.variables.WHICH_MACHINE = hostname;
              }
              ./dotfiles/nixos/machines/${hostname}-hardware.nix
            ];
        };

    in
    {
      nixosConfigurations = {
        desktop = mkSystem {
          hostname = "desktop";
          extraModules = [ ./dotfiles/nixos/machines/desktop.nix ];
        };

        notebook = mkSystem {
          hostname = "notebook";
          extraModules = [
            ./dotfiles/nixos/machines/notebook.nix
            ./dotfiles/nixos/system/wg-vpn.nix
          ];
        };

        tablet = mkSystem {
          hostname = "tablet";
          extraModules = [
            ./dotfiles/nixos/machines/tablet.nix
            ./dotfiles/nixos/system/wg-vpn.nix
          ];
        };

        server = mkSystem {
          hostname = "server";
          extraModules = [ ./dotfiles/nixos/machines/server.nix ];
        };

        # macbook = mkSystem {
        #   hostname = "macbook";
        #   extraModules = [
        #     ./machines/macbook.nix
        #     ./home/work.nix
        #   ];
        # };

      };

      # Development shell for working with the flake
      devShells.${system}.default = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = with nixpkgs.legacyPackages.${system}; [
          nixFlakes
          git
        ];
      };
    };
}
