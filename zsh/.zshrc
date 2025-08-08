
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:${PATH}

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # WSL-specific settings
    PATH="/mnt/c/Windows/System32:$PATH"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS-specific settings
    PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:/opt/homebrew/bin:$PATH"
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

if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure

source ~/.zprofile

alias gs="git status"
alias gc="git commit -m"

alias c="clear"
alias v=nvim
