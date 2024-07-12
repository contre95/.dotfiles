{ config, pkgs,... }:
{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    zsh-completions
    zsh-history-substring-search
    zsh-powerlevel10k
  ];

  programs.zsh = {

    enable = true;

    # Autosuggestions.enable = true;
    # syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      update = "sudo WHICH_MACHINE=$(hostname) nixos-rebuild switch";
      mf = "cd $MY_FOLDER";
      p = "podman --remote";
      vim = "nvim";
      pu = "podman unshare";
      nsh = "nix-shell -p";
      gst = "git status";
      gco = "git checkout";
      ga = "git add";
      gp = "git push";
      gl = "git pull";
      j = "zoxide";
      l = "ls -lFh";
      la = "ls -lAFh";
      lr = "ls -tRFh";
      lt = "ls -ltFh";
      grep = "grep --color";
      ll = "ls -l";
      pq = "pacman -Q | fzf";
      ru = "sudo pacman -Ru \$(pacman -Q | fzf | awk -F\" \" '{print \$1}')";
      sine = "pass Canus/Sinenomine | grep -i -A2 $1";
      startx = "Hyprland";
      containers = "podman container ls --format '{{.Names}}' | grep -v '\-infra' | fzf -1";
      pods = "podman pod ls --format '{{.Name}}' | fzf -1";
      pogs = "podman pod logs -f \`pods\`";
      cosh = "podman container exec -it \`containers\` sh";
      copy = "xclip -sel clip";
      cdr = "cd $(git rev-parse --show-toplevel)";
      here = "pcmanfm .";
      ns = "kubectl get namespaces -o json | jq '.items[].metadata.name' | tr -d '\"' | fzf";
      ch = "cliphist list | fzf | cliphist decode";
      kns = "kubectl config set-context --current --namespace=\`ns\`";
      k = "kubectl";
      ct = "mpg123 --quiet $MY_FOLDER/Library/sounds/ct.mp3";
      al = "mpg123 --quiet $MY_FOLDER/Library/sounds/olx.mp3";
      ed = "mpg123 --quiet $MY_FOLDER/Library/sounds/circus.mp3";
      xf = "mpg123 --quiet $MY_FOLDER/Library/sounds/xfiles.mp3";
      mi = "mpg123 --quiet $MY_FOLDER/Library/sounds/monster_inc.mp3";
      dm = "mpg123 --quiet $MY_FOLDER/Library/sounds/deployersmal.mp3";
      qn = "mpg123 --quiet $MY_FOLDER/Library/sounds/quienteconoce.mp3";
      bf = "mpg123 --quiet $MY_FOLDER/Library/sounds/back2thefuture.mp3";
      fcd = "mpg123 --quiet $MY_FOLDER/Library/sounds/final_countdown.mp3";
      vimc = "nvim $HOME/.config/nvim/init.lua";
      zshc = "nvim $HOME/.zshrc";
      tmuxc = "nvim $HOME/.tmux.conf";
    };

    plugins = with pkgs; [
      {
        file = "powerlevel10k.zsh-theme";
        name = "powerlevel10k";
        src = "${zsh-powerlevel10k}/share/zsh-powerlevel10k";
      }
      {
        file = "p10k.zsh";
        name = "powerlevel10k-config";
        src = "/home/contre/.p10k.zsh";
      }
    ];
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "zsh-users/zsh-completions"; }
        { name = "zsh-users/zsh-history-substring-search"; }
      ];
    };
  };

  programs.fzf =
    {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      defaultOptions = [ "--layout=reverse" "--border" "--height=70%" ];
      # Use fd to find files
      changeDirWidgetCommand = "fd --type d";
      defaultCommand = "fd --type file";
    };
}
