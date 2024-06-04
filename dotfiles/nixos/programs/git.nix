{ ... }: {
  programs.git = {
    enable = true;
    userName = "Contre";
    userEmail = "lucascontre95@gmail.com";
    signing = {
      key = "E27E9BED3E07CE8F";
      signByDefault = true;
    };
    extraConfig = {
      push = { autoSetupRemote = true; };
      pull = { rebase = false; };
      diff = { colorMoved = "default"; };
      core.editor = "nvim";
      color.ui = true;
      github = { user = "thiagokokada"; };
      blame.date = "relative";
    };
    # difftastic = {
    #   enable = true;
    #   display = "inline";
    # };
    ignores = [
      "*~"
      ".DS_Store"
    ];
    iniContent = {
      # Branch with most recent change comes first
      branch.sort = "-committerdate";
      # Remember and auto-resolve merge conflicts
      # https://git-scm.com/book/en/v2/Git-Tools-Rerere
      rerere.enabled = true;
    };
    lfs.enable = false;
    delta = {
      enable = true;
      options = {
        features = "decorations";
        navigate = true;
        light = false;
        syntax-theme = "gruvbox-dark";
        side-by-side = true;
      };
    };
  };
}

