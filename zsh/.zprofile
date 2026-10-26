# .zprofile
# @author deng
# Since 2024 2025 2026

# Initialize the full Homebrew environment only in login shells.
if [[ -x /opt/homebrew/bin/brew && -z $HOMEBREW_PREFIX ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
fi

# /etc/zprofile runs path_helper in login shells, which moves system paths
# ahead of ours. Put the PATH from .zshenv first again; typeset -U drops
# the later duplicates.
path=($_zshenv_path $path)
unset _zshenv_path
