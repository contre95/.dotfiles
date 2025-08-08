{
  config,
  pkgs,
  hostname,
  ...
}:
{
  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    nix-zsh-completions
    zsh-nix-shell
    zsh-fzf-history-search
    zsh-completions
    zsh-history-substring-search
    zsh-powerlevel10k
  ];

  programs.zsh = {
    enable = true;

    initContent = ''
      source $MY_FOLDER/dotfiles/zsh/.p10k.zsh
      eval "$(zoxide init zsh)"
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
      PS1="%F{#008000}%B%n@%m%b %1~:%f"
      export SSH_AUTH_SOCK="$(${config.programs.gpg.package}/bin/gpgconf --list-dirs agent-ssh-socket)"
      ${pkgs.lib.optionalString (hostname == "macbook") ''
        source <(fzf --zsh)
        eval $(ocm handler init)'
        export GPG_TTY=$(tty)
        gpgconf --launch gpg-agent
      ''}
    '';

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/canus/#${hostname}";
      update = "pushd $MY_FOLDER && git pull && sudo nixos-rebuild switch --flake /home/canus/#${hostname}";
      gparted = "sudo --preserve-env gparted";
      iptr = "sudo iptables -t nat -L -v -n";
      gc = "sudo nix-store --gc";
      no = "nix store optimise";
      cg = "sudo nix-collect-garbage --delete-old && nix-collect-garbage -d --delete-old";
      mf = "cd $MY_FOLDER";
      vim = "nvim";
      pu = "podman unshare";
      nsh = "nix-shell -p";
      gst = "git status";
      cdr = "cd \$(git rev-parse --show-toplevel)";
      gd = "git diff";
      ga = "git add";
      gap = "git add --patch";
      g-deleted = "git log --diff-filter=D --summary | grep delete"; # Check deletes files from repo
      gr = "git remote";
      gcm = "git commit -S -m";
      gl = "git pull";
      gp = "git push";
      gco = "git checkout";
      due = "find . -type f | awk -F. '{if (NF>1) print $NF}' | sort | uniq -c | sort -nr"; # Disk Usage per file Extension
      j = "z";
      l = "ls -lFh";
      la = "ls -lAFh";
      lr = "ls -tRFh";
      lt = "ls -ltFh";
      mpvc = "mpv --no-config --vo=tct "; # mpv on the cli
      grep = "grep --color";
      ll = "ls -l";
      sine = "pass Canus/Sinenomine | grep -i -A2 $1";
      services = "systemctl list-units --type=service --all --no-legend | awk '{print \$1}' | sed 's/\.service$//' | fzf -1";
      slogs = "journalctl -u \`services\` -f";
      sosh = "systemctl status \`services\`";
      containers = "podman container ls --format '{{.Names}}' | grep -v infra | fzf -1";
      pods = "podman pod ls --format '{{.Name}}' | fzf -1";
      piu = "for image in $(podman images --format '{{.Repository}}:{{.Tag}}' | grep -v '<none>'); do podman pull $image; done;"; # Update all images
      pogs = "podman pod logs -f \`pods\`";
      cogs = "podman container logs -f \`containers\`";
      pot = "podman top \`containers\` user huser group hgroup";
      cosh = "podman container exec -it \`containers\` sh";
      copy = "xclip -sel clip";
      here = "pcmanfm .";
      tf = "terraform";
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
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history-substring-search"
      ];
    };
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    defaultOptions = [
      "--layout=reverse"
      "--border"
      "--height=70%"
    ];
    # Use fd to find files
    changeDirWidgetCommand = "fd --type d";
    defaultCommand = "fd --type file";
  };
}
