################################################################################################
# Contre env Variables
################################################################################################
export MY_FOLDER='/home/lucas'
export PASSWORD_STORE_DIR=$MY_FOLDER/Pass
export LANG="en_US.UTF-8"
export LC_ALL=en_US.UTF-8
export TERM="tmux-256color"

################################################################################################
# Oh-my-zsh
################################################################################################
# Path to your oh-my-zsh installation.
#export ZSH="/home/contre/.oh-my-zsh"
#source $ZSH/oh-my-zsh.sh
#ZSH_THEME="robbyrussell"

################################################################################################
# Several programs configuration
################################################################################################
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/contre/google-cloud-sdk/path.zsh.inc' ]; then . '/home/contre/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/home/contre/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/contre/google-cloud-sdk/completion.zsh.inc'; fi
# Fuzzy Finder (aka FZF)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# The fuck (terminal typo fixer)
eval $(thefuck --alias)
# The next line enables autojump
[[ -s /home/contre/.cache/yay/autojump-git/pkg/autojump-git/etc/profile.d/autojump.sh  ]] && source /home/contre/.cache/yay/autojump-git/pkg/autojump-git/etc/profile.d/autojump.sh                           
autoload -U compinit && compinit -u

################################################################################################
# Antigen
################################################################################################
source ~/.zsh/antigen.zsh
source ~/.zsh/.theme
antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle autojump
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen bundle common-aliases
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle gretzky/auto-color-ls
# antigen bundle StackExchange/blackbox
# antigen bundle command-not-found
# antigen bundle docker
# antigen bundle docker-compose
antigen bundle golang
antigen bundle python
#antigen bundle web-search
antigen apply


################################################################################################
# User configuration
################################################################################################
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.composer/vendor/bin:/usr/bin:/usr/local/go/bin:/$MY_FOLDER/Scripts/meli-scr:$PATH$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='vim'
fi

# Uncomment this when using termite or any other minimalistic Terminal
# export TERM=xterm


################################################################################################
# TMUX Autostart 
################################################################################################
#if [ "$TMUX" = "" ]; then tmux; fi


################################################################################################
# SSH Configuration 
################################################################################################
export SSH_KEY_PATH="~/.ssh/rsa_id"


################################################################################################
# SSH Configuration with GPG
################################################################################################
#echo [KEYGRIP] >> ~/.gnupg/sshcontrol
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
#gpgconf --launch gpg-agent


################################################################################################
# Alias 
################################################################################################
alias mf="cd $MY_FOLDER"
alias xf="mpg123 --quiet $MY_FOLDER/Library/xfiles.mp3"
alias qn="mpg123 --quiet $MY_FOLDER/Library/quienteconoce.mp3"
alias mi="mpg123 --quiet $MY_FOLDER/Library/monster_inc.mp3"
alias al="mpg123 --quiet $MY_FOLDER/Library/olx.mp3"
alias fcd="mpg123 --quiet $MY_FOLDER/Library/final_countdown.mp3"
alias bf="mpg123 --quiet $MY_FOLDER/Library/back2thefuture.mp3"
alias ed="mpg123 --quiet $MY_FOLDER/Library/circus.mp3"
alias dm="mpg123 --quiet $MY_FOLDER/Library/deployersmal.mp3"
alias copy='xclip -sel clip'


##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
#HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

##############################################################################
# MacBook Pro configuration 
##############################################################################
# Just in case the unfortunate way Mac has to "Supr" does not work on your terminal.. then here's the fix
#bindkey "^[[3~" delete-char

################################################################################################
# Languae environments setup
################################################################################################
#Node version manager (nvm)
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
source ~/.nvm/nvm.sh
# Python version manager (Pyenv)
eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
