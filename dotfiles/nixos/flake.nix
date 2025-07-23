{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nur.url = "github:nix-community/NUR";
    
    # Optional: Add other flake inputs you might need
    # hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      
      # Create an overlay for unstable packages
      unstableOverlay = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      
      # Common configuration shared across all machines
      commonModules = [
        ./home/contre.nix
        ./system/boot.nix
        ./system/test.nix
        ./system/fonts.nix
        ./system/shell.nix
        ./system/sound.nix
        ./system/version.nix
        ./system/graphics.nix
        ./system/security.nix
        ./system/bluetooth.nix
        ./system/containers.nix
        ./system/networking.nix
        ./system/monitoring.nix
        home-manager.nixosModules.home-manager
        {
          nixpkgs.overlays = [ unstableOverlay nur.overlay ];
          nixpkgs.config.allowUnfree = true;
          
          # Home Manager configuration
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
          };
          
          # Enable flakes system-wide
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          
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
      mkSystem = { hostname, extraModules ? [] }: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = commonModules ++ extraModules ++ [
          {
            networking.hostName = hostname;
            environment.variables.MYENV = hostname;
            environment.variables.WHICH_MACHINE = hostname;
          }
          /etc/nixos/hardware-configuration.nix
        ];
      };
      
    in {
      nixosConfigurations = {
        desktop = mkSystem {
          hostname = "desktop";
          extraModules = [ ./machines/desktop.nix ];
        };
        
        notebook = mkSystem {
          hostname = "notebook";
          extraModules = [ 
            ./machines/notebook.nix 
            ./system/wg-vpn.nix
          ];
        };
        
        tablet = mkSystem {
          hostname = "tablet";
          extraModules = [ 
            ./machines/tablet.nix 
            ./system/wg-vpn.nix
          ];
        };
        
        server = mkSystem {
          hostname = "server";
          extraModules = [ ./machines/server.nix ];
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

