# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
SAVEHIST=40000 # Number of entries
HISTSIZE=40000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY # Don't erase history
setopt EXTENDED_HISTORY # Add additional data to history like timestamp
setopt INC_APPEND_HISTORY # Add immediately
setopt HIST_FIND_NO_DUPS # Don't show duplicates in search
setopt HIST_IGNORE_SPACE # Don't preserve spaces. You may want to turn it off
setopt NO_HIST_BEEP # Don't beep
setopt SHARE_HISTORY # Share history between session/terminals

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man colorize pip python zsh-syntax-highlighting z zsh-completions)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export LC_ALL=en_US.UTF-8
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export LANG=en_US.UTF-8
fortune | cowsay | lolcat

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

findnamefromroot() {
    find / -name $1
}

findstringinfile() {
    grep -rnw $1 -e $2
}

findprocess() {
    ps -ef | grep $1
}

toc() {
    markdown-toc -i $1
}

alias findn=findnamefromroot
alias greps=findstringinfile
alias vir=vimrem
alias findp=findprocess


alias gyp='ssh amolagrawal@gypsum-gateway.cs.umass.edu'
alias blk='ssh amolagrawal@blake2.cs.umass.edu'
alias fzf='fzf --preview="head -$LINES {}"'


#function snotebook ()
#{
#SPARK_PATH=~/spark

#export PYSPARK_DRIVER_PYTHON="jupyter"
#export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

#$SPARK_PATH/bin/pyspark --master local[2]
#}
alias vi='nvim'
alias vim='nvim'

alias icat="kitty +kitten icat"
alias mas='cd /home/amol/repos/umass'
#alias blue="a2dp.py 0C:A6:94:60:BC:68"
#source /home/amol/Downloads/google-cloud-sdk/completion.zsh.inc
#source /home/amol/Downloads/google-cloud-sdk/path.zsh.inc

[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
source ~/repos/liquidprompt/liquidprompt

# added by Anaconda3 installer
#export PATH="/home/amol/anaconda3/bin:$PATH"


export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"
export CUDA_HOME=/usr/local/cuda
#export MALMO_XSD_PATH="~/repos/malmo/Schemas"
export MKL_THREADING_LAYER=GNU

#cat ~/.cache/wal/sequences

## To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
export PATH=$PATH:/opt/pig/bin
export PATH=$PATH:/usr/local/cuda/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"

export PATH=/usr/share/swift/usr/bin:/opt/ros/kinetic/bin:/home/amol/anaconda3/bin:/usr/local/go/bin:/home/amol/anaconda3/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/amol/.fzf/bin:/opt/pig/bin:/usr/local/cuda/bin
eval $(thefuck --alias)
export VISUAL=nvim
export EDITOR="$VISUAL"

# TMUX
#if which tmux >/dev/null 2>&1; then
    ##if not inside a tmux session, and if no session is started, start a new session
    #test -z "$TMUX" && (tmux attach || tmux new-session)
#fi
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    autoload -Uz compinit
    compinit
    # Completion for kitty
    kitty + complete setup zsh | source /dev/stdin
    install() {
        sudo apt-get install $1
    }
    alias update='sudo apt-get update'

  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
