# .zshrc
# @author deng
# since 2024 2025 2026

# zmodload zsh/zprof

# Emacs keymap. zsh selects vi mode when $EDITOR contains "vi", so set this
# before plugins and fzf add their bindings.
bindkey -e

# Make Homebrew completions available in non-login shells too.
typeset -U fpath
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# fzf: Ctrl-T files, Ctrl-R history, Alt-C directories, **<Tab> fuzzy completion.
# Load before fzf-tab so fzf-tab owns Tab and calls fzf's widget underneath it.
(( $+commands[fzf] )) && eval "$(fzf --zsh)"

# Plugins (antidote). The bundle list is .zsh_plugins.txt; the generated
# static file and the completion dump stay in ~/.cache/zsh.
# Keep compinit's dump cache, permission checks, and completion file count check.
zstyle ':plugin:ez-compinit' 'use-cache' no
zstyle ':antidote:bundle' file "$HOME/.config/zsh/.zsh_plugins.txt"
zstyle ':antidote:static' file "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zsh_plugins.zsh"
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load

# History
# HISTSIZE above SAVEHIST gives hist_expire_dups_first room to drop duplicates.
HISTSIZE=60000
SAVEHIST=50000
HISTFILE=$HOME/.zsh_history
setopt append_history share_history extended_history \
       hist_ignore_space hist_ignore_dups hist_find_no_dups \
       hist_save_no_dups hist_expire_dups_first

# Completion. macOS sets no LS_COLORS, so generate it for list-colors.
(( $+commands[gdircolors] )) && eval "$(gdircolors -b)"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Aliases
[ -f "$HOME/.config/zsh/.zsh_aliases" ] && . "$HOME/.config/zsh/.zsh_aliases"

# Shell navigation shortcuts.
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^[w' kill-region

# Smarter cd.
(( $+commands[zoxide] )) && eval "$(zoxide init --cmd cd zsh)"

# Prompt.
(( $+commands[starship] )) && eval "$(starship init zsh)"

# zprof
