# .zshenv
# @author deng
# since 2024 2025 2026

# Read by every zsh, including non-interactive ones. Keep it fast and silent.

# Default editor.
export EDITOR=nvim
export VISUAL=$EDITOR

# PATH in priority order. Keep Homebrew tools ahead of macOS system shims
# even when HOMEBREW_PREFIX is inherited. typeset -U drops later duplicates.
# .zprofile puts _zshenv_path first again after path_helper.
export BUN_INSTALL="$HOME/.bun"
typeset -U path
_zshenv_path=(
  $BUN_INSTALL/bin
  $HOME/.local/bin
  /opt/homebrew/opt/openjdk@21/bin
  $HOME/.okc/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
)
path=($_zshenv_path $path)
if [[ -d $HOME/.lmstudio/bin ]]; then
  path+=($HOME/.lmstudio/bin)
fi

# fzf defaults.
if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
fi
if (( $+commands[fd] )); then
  export FZF_CTRL_T_COMMAND="fd --type f --hidden --exclude .git"
  export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
fi
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --border --cycle --preview-window=wrap"

# Machine-local settings and secrets (gitignored).
if [[ -r $HOME/.config/zsh/local.zsh ]]; then
  source "$HOME/.config/zsh/local.zsh"
fi

