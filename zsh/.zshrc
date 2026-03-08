
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:${PATH}

if grep -qi microsoft /proc/version 2>/dev/null; then
    # WSL2-specific settings
    PATH="/mnt/c/Windows/System32:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS-specific settings — use brew prefix to support both Intel and Apple Silicon
    if command -v brew &>/dev/null; then
        PATH="$(brew --prefix)/bin:$PATH"
    fi
fi

export PATH

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

set -o vi

export VISUAL=nvim
export EDITOR=nvim
# Only set TERM inside tmux; let the terminal set it otherwise
[ -n "$TMUX" ] && export TERM="tmux-256color"
export BROWSER="firefox"
export REPOS="$HOME/repos"
export TIME_STYLE="long-iso"

HISTFILE=~/.zsh_history
HISTSIZE=999999
SAVEHIST=$HISTSIZE
HISTORY_IGNORE='(l|ls|ll|cd|cd ..|pwd|exit|date|history)'

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY

bindkey "^[[3~" delete-char                     # Key Del
bindkey "^[[5~" beginning-of-buffer-or-history  # Key Page Up
bindkey "^[[6~" end-of-buffer-or-history        # Key Page Down
bindkey "^[[H" beginning-of-line                # Key Home
bindkey "^[[F" end-of-line                      # Key End
bindkey "^[[1;3C" forward-word                  # Key Alt + Right
bindkey "^[[1;3D" backward-word                 # Key Alt + Left
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

if [[ "$OSTYPE" == darwin* ]] && command -v brew &>/dev/null; then
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi

autoload -Uz compinit
# Only regenerate compdump once per day
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

eval "$(starship init zsh)"

# Editor
alias vim='nvim'
alias vi='nvim'
alias v='nvim'

# ls
LS_FLAGS="--all --group-directories-first --sort=name"
alias ls="eza ${LS_FLAGS} --across"
alias ll="eza ${LS_FLAGS} --long --group --header --binary --created --modified --git --classify -a"
alias l="ls"
alias tree="ll --tree"

# Git
alias gst="git status"
alias gc="git commit -m"

# Navigation
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
