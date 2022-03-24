# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

ZSH_DISABLE_COMPFIX=true

# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose python pip nvm node npm zsh-autosuggestions zsh-syntax-highlighting)


### CUSTOM CONFIGS ###

umask 0002

alias ls='lsd -aF --group-dirs first'
alias l='ls'
alias ll='lsd -alhF --group-dirs first'
alias tree='lsd -ahF --group-dirs first --tree'

alias bat='bat --theme=ansi'


export NVM_DIR="$HOME/workspaces/runtimes/.nvm"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/username/workspaces/runtimes/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/username/workspaces/runtimes/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/username/workspaces/runtimes/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/username/workspaces/runtimes/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
