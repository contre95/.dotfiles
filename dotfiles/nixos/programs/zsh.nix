{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    zsh-completions
    zsh-history-substring-search
    zsh-powerlevel10k
  ];

  # export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  programs.zsh = {

    initExtra = ''
      ${if config.services.gpg-agent.enable then
        ''
          if [[ -z "$SSH_AUTH_SOCK" ]]; then
            export SSH_AUTH_SOCK="$(${config.programs.gpg.package}/bin/gpgconf --list-dirs agent-ssh-socket)"
          fi
        '' else ''''
      }
      source ~/.config/.p10k.zsh
      eval "$(zoxide init zsh)"
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
    '';

    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };


    shellAliases = {
      update = "sudo WHICH_MACHINE=$(hostname) nixos-rebuild switch";
      update-mac = "sudo WHICH_MACHINE=macbook darwin-rebuild";
      mf = "cd $MY_FOLDER";
      p = "podman --remote";
      vim = "nvim";
      pu = "podman unshare";
      nsh = "nix-shell -p";
      gst = "git status";
      gd = "git diff";
      ".." = "cd ..";
      gA = "git add .";
      gS = "git stash";
      ga = "git add";
      gap = "git add --patch";
      gbD = "git branch -D";
      gc = "git checkout";
      gcb = "git checkout -b";
      gr = "git remote";
      gcm = "git commit -S -m";
      gll = "git pull";
      gp = "git push";
      gt = "gitui";
      gco = "git checkout";
      gl = "git pull";
      j = "z";
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
      containers = "podman container ls --format '{{.Names}}' | grep -v infra | fzf -1";
      pods = "podman pod ls --format '{{.Name}}' | fzf -1";
      pogs = "podman pod logs -f \`pods\`";
      pot = "podman top \`containers\` user huser group hgroup";
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
        src = "${config.xdg.configHome}/.p10k.zsh";
      }
    ];
    # I gave it a try, but I couldn't make load time any faster :/
    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "zsh-users/zsh-autosuggestions"; }
    #     { name = "zsh-users/zsh-syntax-highlighting"; }
    #     { name = "zsh-users/zsh-completions"; }
    #     { name = "zsh-users/zsh-history-substring-search"; }
    #   ];
    # };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "history-substring-search"
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
