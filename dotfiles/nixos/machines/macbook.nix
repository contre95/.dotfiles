{ ... }:
{
  users.users."lucas.contreras".home = "/Users/lucas.contreras";

  nix.extraOptions = ''
    experimental-features = nix-command
  '';

  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      brewfile = true;
    };
    casks = [
      # "slack"
      # "zoom"
      "1password"
      # "goland"
      # "pycharm"
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
