### CUSTOM CONFIGS ###

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

umask 0002

# For ls (Linux):
alias ls='ls -aF --group-directories-first --color=auto'
alias l='ls'
alias ll='ls -alhF --group-directories-first --color=auto'

# For gls (macOS):
# alias ls='gls -aF --group-directories-first --color=auto'
# alias l='ls'
# alias ll='gls -alhF --group-directories-first --color=auto'

alias bat='bat --theme=ansi'


## CUDA ##
# Change to installed CUDA version:
# export CUDA_VERSION=[CUDA_VERSION]
export CUDA_VERSION=11.0
export CUDA_HOME="/usr/local/cuda-${CUDA_VERSION}"
export CUDA_PATH="${CUDA_HOME}"
export PATH="${CUDA_PATH}/bin:${PATH}"
export LIBRARY_PATH="${CUDA_PATH}/lib64:${LIBRARY_PATH}"
export LD_LIBRARY_PATH="${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH="${CUDA_PATH}/extras/CUPTI/lib64:${LD_LIBRARY_PATH}"
export NVCC="${CUDA_PATH}/bin/nvcc"
export CFLAGS="-I${CUDA_PATH}/include ${CFLAGS}"

## TensorRT ##
# Change to your installed TensorRT version:
# export TENSORRT_VERSION=[TENSORRT_VERSION]
export TENSORRT_VERSION=7.2.0.14
export TENSORRT_PATH="/opt/tensorrt/TensorRT-${TENSORRT_VERSION}"
export PATH="${TENSORRT_VERSION}/bin:${PATH}"
export LD_LIBRARY_PATH="${TENSORRT_PATH}/lib:${LD_LIBRARY_PATH}"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/username/workspaces/runtimes/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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
conda activate py38


export NVM_DIR="$HOME/workspaces/runtimes/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export JAVA_HOME="/usr/lib/jvm/jdk-17.0.2"
export PATH="${JAVA_HOME}/bin:${PATH}"
