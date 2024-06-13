{ pkgs, ... }: {
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
