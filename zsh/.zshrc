
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
export TERM="tmux-256color"

export BROWSER="firefox"

export REPOS="$HOME/repos"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY        # Share history between sessions

bindkey -e

bindkey "^[[3~" delete-char                     # Key Del
bindkey "^[[5~" beginning-of-buffer-or-history  # Key Page Up
bindkey "^[[6~" end-of-buffer-or-history        # Key Page Down
bindkey "^[[H" beginning-of-line                # Key Home
bindkey "^[[F" end-of-line                      # Key End
bindkey "^[[1;3C" forward-word                  # Key Alt + Right
bindkey "^[[1;3D" backward-word                 # Key Alt + Left

if [[ "$OSTYPE" == darwin* ]] && command -v brew &>/dev/null; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi

eval "$(starship init zsh)"

source ~/.zprofile

alias gs="git status"
alias gc="git commit -m"

alias c="clear"
alias v=nvim
