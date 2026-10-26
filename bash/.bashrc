# .bashrc
# @author deng
# since 2024 2025

case $- in # check shell options
    *i*) ;; # interactive shell
      *) return;; # don't do anything
esac

# Starship
[ -x $(command -v eza) ] && eval "$(starship init bash)" 

# Default Editor
export EDITOR=nvim
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# History Control
HISTCONTROL=ignoreboth
HISTSIZE=2000
SAVEHIST=$HISTSIZE
shopt -s histappend
shopt -s checkwinsize

# Aliases
[ -f "$HOME/.config/bash/.bash_aliases" ] && . "$HOME/.config/bash/.bash_aliases"

# dircolors
# [ -f "$HOME/.config/bash/dircolors" ] && eval $(dircolors -b "$HOME/.config/bash/dircolors")

# Fzf
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--height 40% --layout reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--height 40% --layout reverse --border'
eval "$(fzf --bash)" # Fzf

# Keybindings
set -o vi
bind -m vi-command ".":insert-last-argument
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word
