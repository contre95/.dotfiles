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
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
#     gpgconf --create-socketdir
# else
#   export GPG_TTY="$(tty)"
#   export EDITOR='nvim'
#   export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#   gpgconf --launch gpg-agent
# fi
  programs.zsh = {
    initExtra = ''
      source $MY_FOLDER/dotfiles/zsh/.p10k.zsh
      eval "$(zoxide init zsh)"
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
      PS1="%F{#008000}%B%n@%m%b %1~:%f"
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
      rebuild = "sudo WHICH_MACHINE=$(hostname) nixos-rebuild switch";
      rebuild-boot = "sudo WHICH_MACHINE=$(hostname) nixos-rebuild boot";
      gparted = "sudo --preserve-env gparted";
      update = "pushd $MY_FOLDER && git pull && sudo WHICH_MACHINE=$(hostname) nixos-rebuild switch";
      iptr = "sudo iptables -t nat -L -v -n";
      gc = "sudo nix-store --gc";
      no = "nix store optimise";
      cg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
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
      gcb = "git checkout -b";
      gr = "git remote";
      gcm = "git commit -S -m";
      gll = "git pull";
      gp = "git push";
      gt = "gitui";
      gco = "git checkout";
      gl = "git pull";
      due = "find . -type f | awk -F. '{if (NF>1) print $NF}' | sort | uniq -c | sort -nr"; # Disk Usage per file Extension
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
      cogs = "podman container logs -f \`containers\`";
      pot = "podman top \`containers\` user huser group hgroup";
      cosh = "podman container exec -it \`containers\` sh";
      copy = "xclip -sel clip";
      cdr = "cd $(git rev-parse --show-toplevel)";
      here = "pcmanfm .";
      ns = "kubectl get namespaces -o json | jq '.items[].metadata.name' | tr -d '\"' | fzf";
      ch = "cliphist list | fzf | cliphist decode";
      kns = "kubectl config set-context --current --namespace=\`ns\`";
      k = "kubectl";
      ct = "mpg123 --quiet $MY_FOLDER/library/sounds/ct.mp3";
      al = "mpg123 --quiet $MY_FOLDER/library/sounds/olx.mp3";
      ed = "mpg123 --quiet $MY_FOLDER/library/sounds/circus.mp3";
      xf = "mpg123 --quiet $MY_FOLDER/library/sounds/xfiles.mp3";
      mi = "mpg123 --quiet $MY_FOLDER/library/sounds/monster_inc.mp3";
      dm = "mpg123 --quiet $MY_FOLDER/library/sounds/deployersmal.mp3";
      qn = "mpg123 --quiet $MY_FOLDER/library/sounds/quienteconoce.mp3";
      bf = "mpg123 --quiet $MY_FOLDER/library/sounds/back2thefuture.mp3";
      fcd = "mpg123 --quiet $MY_FOLDER/library/sounds/final_countdown.mp3";
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
      # {
      #   file = "p10k.zsh";
      #   name = "powerlevel10k-config";
      #   src = "${config.xdg.configHome}/.p10k.zsh";
      # }
    ];

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
