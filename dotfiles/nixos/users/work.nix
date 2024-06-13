{ pkgs, ... }: {
  users.users.contre.home = "/Users/contre";
  environment = {
    shells = with pkgs; [ zsh ];
    darwinConfig = "/Users/contre/dotfiles/nixos/configuration.nix";
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

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
}
