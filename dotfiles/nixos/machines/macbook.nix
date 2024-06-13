{ ... }: {
  users.users.contre.home = "/Users/contre";
  services.nix-daemon.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command
  '';
  nix-hombrew.enable = true;
  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      brewfile = true;

    };
    casks = [
      "slack"
      "zoom"
      "1password"
      "goland"
      "pycharm"
      "rectangle"
      "notion"
      "notion-calendar"
      "viscosity"
      "bruno"
    ];
  };


  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;

        # Hide the top menu bar
        _HIHideMenuBar = false;
      };
      dock = {
        autohide = true;
        orientation = "bottom";
        show-recents = false;
      };
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  system.stateVersion = 4;
}

