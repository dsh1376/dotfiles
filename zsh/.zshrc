# .zshrc
# @author deng
# since 2024 2025 2026

# zmodload zsh/zprof

case $- in *i*) ;; *) return;; esac

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname "$ZINIT_HOME")"
[ ! -d "$ZINIT_HOME/.git" ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugins
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    Aloxaf/fzf-tab

zinit ice as"command" from"gh-r" \
         atclone="./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
         atpull="%atclone" src="init.zsh"
zinit light starship/starship

# Environment
export EDITOR=nvim
export PATH="/opt/homebrew/opt/openjdk@21/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt append_history share_history \
       hist_ignore_space hist_ignore_dups hist_find_no_dups \
       hist_save_no_dups hist_expire_dups_first

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^[w' kill-region

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
[ -f "$HOME/.config/zsh/.zsh_aliases" ] && . "$HOME/.config/zsh/.zsh_aliases"

# Shell integrations
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='--height 40% --layout reverse'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=bg:-1,bg+:#313244,fg:#cdd6f4,fg+:#cdd6f4,hl:#f38ba8,hl+:#f38ba8,info:#cba6f7,prompt:#cba6f7,pointer:#f5e0dc,marker:#b4befe,spinner:#f5e0dc,header:#f38ba8,border:#6c7086"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# zprof

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/dsh/.lmstudio/bin"
# End of LM Studio CLI section
