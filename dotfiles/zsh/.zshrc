
################################################################################################
# Env Variables
################################################################################################
export KEYTIMEOUT=10
export LANG="en_US.UTF-8"
export PASSWORD_STORE_DIR=$MY_FOLDER/pass
export LC_ALL=en_US.UTF-8
export KUBECONFIG=~/.kube/config

################################################################################################
# Several programs configuration
################################################################################################
# Fuzzy Finder (aka FZF)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
# No plugin manager
autoload -U compinit && compinit -u
autoload -U history-search-end
autoload -U colors && colors
source ~/.zsh/.theme

################################################################################################
# Custom PATH  settings
################################################################################################
export PATH="$MY_FOLDER/scripts/bin-scr:$PATH"                  # Custom Scripts
export PATH="$MY_FOLDER/bin:$PATH"                              # Custom binaries
export PATH="$HOME/.local/bin:$PATH"                            # ~/.local
export PATH="/usr/local/bin:$PATH"                              # /usr/local
export PATH="/usr/bin:$PATH"                                    # just env in nix.. apparently 
# If os is darwin
if [[ $(uname) = "Darwin" ]]; then
	export PATH="$PATH:/Users/lucas.contreras/.nix-profile/bin:/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$HOME/.pyenv/bin:/go/bin/";
 	export NIX_PATH="/Users/lucas.contreras/.nix-defexpr/channels:darwin-config=/Users/canus/dotfiles/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
fi
# export PATH="$HOME/bin:$PATH"                                 # tfswitch
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"          # Mason binaries (Neovim)

################################################################################################
# User configuration
################################################################################################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
	gpgconf --create-socketdir
else
	export GPG_TTY="$(tty)"
	# export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
	# gpg-connect-agent updatestartuptty /bye >/dev/null
	# export EDITOR='nvim'
	# # Only use gpg/ssh keys when not in an SSH connection. Not to replace the keys forwarded by the ssh agent.
	# # SSH Configuration with GPG
	# #echo [KEYGRIP] >> ~/.gnupg/sshcontrol
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	# gpgconf --launch gpg-agent
fi

# Search with Ctrl+R
bindkey -v
bindkey '^R' history-incremental-search-backward

################################################################################################
# Shell Functions
################################################################################################
sr() {
  echo "Replacing recursively $1 with $2"
  grep -rl "$1" | xargs sed -i "s/$1/$2/g"                
}

################################################################################################
# Aliases
################################################################################################
shellAliases = {
mf="cd $MY_FOLDER";
p="podman --remote";
pu="podman unshare";
nsh="nix-shell -p";
gst="git status";
gp="git push";
gl="git pull";
j="z";
l='ls -lFh'     #size,show type,human readable;
la='ls -lAFh'   #long list,show almost all,show type,human readable;
lr='ls -tRFh'   #sorted by date,recursive,show type,human readable;
lt='ls -ltFh'   #long list,sorted by date,show type,human readable;
grep='grep --color';
ll='ls -l'      #long list;
pq="pacman -Q | fzf";
ru="sudo pacman -Ru \$(pacman -Q | fzf | awk -F\" \" '{print \$1}')";
sine="pass Canus/Sinenomine | grep -i -A2 $1";
startx="Hyprland";
containers="podman container ls --format '{{.Names}}' | grep -v '\-infra' | fzf -1";
pods="podman pod ls --format '{{.Name}}' | fzf -1";
pogs="podman pod logs -f \`pods\`";
cosh="podman container exec -it \`containers\` sh";
copy='xclip -sel clip';
cdr='cd $(git rev-parse --show-toplevel)';
here='pcmanfm .';
ns="kubectl get namespaces -o json | jq '.items[].metadata.name' | tr -d '\"' | fzf";
ch="cliphist list | fzf | cliphist decode";
kns="kubectl config set-context --current --namespace=\`ns\`";
k='kubectl';
ct="mpg123 --quiet $MY_FOLDER/Library/sounds/ct.mp3";
al="mpg123 --quiet $MY_FOLDER/Library/sounds/olx.mp3";
ed="mpg123 --quiet $MY_FOLDER/Library/sounds/circus.mp3";
xf="mpg123 --quiet $MY_FOLDER/Library/sounds/xfiles.mp3";
mi="mpg123 --quiet $MY_FOLDER/Library/sounds/monster_inc.mp3";
dm="mpg123 --quiet $MY_FOLDER/Library/sounds/deployersmal.mp3";
qn="mpg123 --quiet $MY_FOLDER/Library/sounds/quienteconoce.mp3";
bf="mpg123 --quiet $MY_FOLDER/Library/sounds/back2thefuture.mp3";
fcd="mpg123 --quiet $MY_FOLDER/Library/sounds/final_countdown.mp3";
vimc="nvim $HOME/.config/nvim/init.lua";
zshc="nvim $HOME/.zshrc";
tmuxc="nvim $HOME/.tmux.conf";
  };

##############################################################################
# History Configuration
##############################################################################
export SAVEHIST=5000           #Number of history entries to save to disk
export HISTSIZE=5000           #How many lines of history to keep in memory
export HISTFILE=~/.zsh_history #Where to save history to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt appendhistory    #Append history to the history file (no overwriting)
setopt sharehistory     #Share history across terminals
setopt incappendhistory #Immediately append to the history file, not just when a term is killed

################################################################################################
# Languae environments setup
################################################################################################
# Python version manager (Pyenv)
export BROWSER="librewolf"
alias vim="nvim"
alias tf="terraform"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# source $HOME/.gvm/scripts/gvm

# Node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Golang versions manager
[[ -s "/home/contre/.gvm/scripts/gvm" ]] && source "/home/contre/.gvm/scripts/gvm"

################################################################################################
# OS X Specific configuration
################################################################################################
if [[ $(uname) == "Darwin" ]]; then
  # Home folder
  export MY_FOLDER="/Users/canus"
  # Just in case the unfortunate way Mac has to "Supr" does not work on your terminal.. then here's the fix
  bindkey "^[[3~" delete-char
  # Configuration from here https://github.com/auth0/layer0-base/?tab=readme-ov-file#installing-tools-for-local-development
  eval "$(direnv hook zsh)" # For other shell read: https://direnv.net/docs/hook.html
  # Gatekeeper: Unalias gk from zsh git aliases due to gatekeepr conflict `unalias gk`
  unalias gk
  # Azure CLI autocomplete (Optional)
  # autoload bashcompinit && bashcompinit
  # source /usr/local/etc/bash_completion.d/az
  # To avoid any terraform state loss on these long running aiven operations:
fi
