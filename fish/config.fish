# fish/config.fish
# @author deng
# since 2024 2025 2026

# Default editor.
set -gx EDITOR nvim
set -gx VISUAL $EDITOR

# Homebrew environment.
if test -x /opt/homebrew/bin/brew; and not set -q HOMEBREW_PREFIX
    eval (/opt/homebrew/bin/brew shellenv)
end

# Keep Homebrew tools ahead of macOS system shims even when HOMEBREW_PREFIX is inherited.
fish_add_path --global /opt/homebrew/bin /opt/homebrew/sbin

# User and package paths.
fish_add_path --global \
    $HOME/.local/bin \
    /opt/homebrew/opt/openjdk@21/bin
if test -d "$HOME/.lmstudio/bin"
    fish_add_path --global --append "$HOME/.lmstudio/bin"
end

# Bun is available in both interactive and non-interactive shells.
set -gx BUN_INSTALL "$HOME/.bun"
# Remove inherited copies before prepending, including those from older shells.
set -gx PATH "$BUN_INSTALL/bin" (string match --invert -- "$BUN_INSTALL/bin" $PATH)

# fzf defaults.
if command -q rg
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git'"
end
set -gx FZF_DEFAULT_OPTS "--height=40% --layout=reverse --border --cycle --preview-window=wrap"
set -g fzf_fd_opts --hidden --exclude .git

# Keep non-interactive shells lightweight.
status is-interactive; or return

# Cute startup greeting, called by fish only in interactive shells.
# Catppuccin Mocha pink and blue.
function fish_greeting
    set -l pink (set_color --bold f5c2e7)
    set -l blue (set_color 89b4fa)
    set -l off (set_color normal)
    printf '%sNyaa~ %sterminal ready! %s(^._.^)~ %s<3%s\n' \
        $pink $blue $pink $blue $off
end

# Fippuccin maps Fish syntax colors to Catppuccin Mocha.
fish_config theme choose fippuccin

# Directory listing aliases.
if command -q eza
    alias l.="eza -a"
    alias ls="eza -F --sort=type --icons=always"
    alias ll="eza -aF --long --sort=type --icons=always"
    alias lt4="eza -lT -L4 --icons"
end

# Small command shortcuts.
abbr --add --position command -- '~' 'cd ~'
alias ..="cd .."
alias c="clear"
alias ff="fastfetch"
alias vi="nvim"
alias vim="nvim"
alias gst="git status"
alias cfg="cd ~/.config"
alias 哈吉米="cat"

# Claude
alias cc="claude"

# Default Fish key bindings.
fish_default_key_bindings

# Shell navigation shortcuts.
bind ctrl-p history-search-backward
bind ctrl-n history-search-forward
bind ctrl-a beginning-of-line
bind ctrl-e end-of-line
bind ctrl-f accept-autosuggestion
bind alt-w kill-selection

# Smarter cd.
if command -q zoxide
    zoxide init --cmd cd fish | source
end

# Prompt.
if command -q starship
    starship init fish | source
end
