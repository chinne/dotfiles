export XDG_CONFIG_HOME=$HOME/.config
export PATH="$PATH;"

PERSONAL=$XDG_CONFIG_HOME/personal
#for i in `find -L $PERSONAL`; do
    #source $i
#done

# zsh parameters: http://zsh.sourceforge.net/Doc/Release/Parameters.html#Parameters-Used-By-The-Shell

# Setting history length
HISTSIZE=999999
SAVEHIST=$HISTSIZE

# Make some commands not show up in history
HISTORY_IGNORE='(l|ls|ll|cd|cd ..|pwd|exit|date|history)'

# Binds Up and Down to a history search, backwards and forwards.
# Source: https://unix.stackexchange.com/a/97844
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Zsh Options: http://zsh.sourceforge.net/Doc/Release/Options.html

###############################################################################
# Neovim
###############################################################################
# Make Neovim the default editor
export EDITOR="nvim"

alias vim='nvim'
alias vi='nvim'
alias v="nvim"

# eza is a modern ls.
export TIME_STYLE="long-iso"
LS_FLAGS="--all --group-directories-first --sort=name"
alias ls="eza ${LS_FLAGS} --across"
alias ll="eza ${LS_FLAGS} --long --group --header --binary --created --modified --git --classify -a"
alias l="ls"
alias tree="ll --tree"

# Handy aliases for going up in a directory
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Setting PATH for Python 3.12
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:${PATH}"
export PATH
