PATH=/bin:/usr/bin:/usr/local/bin:/sbin:${PATH}

fastfetch

HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -e

bindkey "^[[3~" delete-char                     # Key Del
bindkey "^[[5~" beginning-of-buffer-or-history  # Key Page Up
bindkey "^[[6~" end-of-buffer-or-history        # Key Page Down
bindkey "^[[H" beginning-of-line                # Key Home
bindkey "^[[F" end-of-line                      # Key End
bindkey "^[[1;3C" forward-word                  # Key Alt + Right
bindkey "^[[1;3D" backward-word                 # Key Alt + Left

eval "$(starship init zsh)"

source ~/.zprofile
