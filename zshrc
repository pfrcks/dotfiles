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
plugins=(git colored-man-pages colorize pip python zsh-syntax-highlighting z zsh-completions)

source $ZSH/oh-my-zsh.sh

fortune | cowsay | lolcat

[ -f ~/.fzf/shell/completion.zsh ] && source ~/.fzf/shell/completion.zsh
[ -f ~/.fzf/shell/key-bindings.zsh ] && source ~/.fzf/shell/key-bindings.zsh
source ~/repos/liquidprompt/liquidprompt

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

case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    autoload -Uz compinit
    compinit
    # Completion for kitty
    # kitty + complete setup zsh | source /dev/stdin
    install() {
        sudo apt-get install $1
    }
    alias update='sudo apt-get update'

  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

alias findn=findnamefromroot
alias greps=findstringinfile
alias vir=vimrem
alias findp=findprocess


alias vi='nvim'
alias vim='nvim'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

export VISUAL=nvim
export EDITOR="$VISUAL"

export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color
export LC_ALL=en_US.UTF-8
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export LANG=en_US.UTF-8
export PATH=$PATH:~/.local/bin

eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
