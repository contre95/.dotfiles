{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Contre";
    userEmail = "lucascontre95@gmail.com";
    signing = {
      key = "E27E9BED3E07CE8F";
    };
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      blame.date = "relative";
      pull = {
        rebase = false;
      };
      diff = {
        colorMoved = "default";
      };
      push = {
        autoSetupRemote = true;
      };
      github = {
        user = "thiagokokada";
      };
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
      branch.sort = "-committerdate"; # Branch with most recent change comes first
      rerere.enabled = true; # Remember and auto-resolve merge conflicts https://git-scm.com/book/en/v2/Git-Tools-Rerere
    };
    lfs.enable = false;
    delta = {
      enable = true;
      options = {
        light = false;
        navigate = true;
        side-by-side = true;
        features = "decorations";
        syntax-theme = "gruvbox-dark";
      };
    };
  };

}
