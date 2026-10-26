# Dotfiles

Personal configuration files for a terminal-centric macOS development environment, unified around the **Catppuccin Mocha** palette.

## Structure

```text
.config/
├── bash/           # Fallback shell
├── bat/            # Syntax-highlighted file previews
├── btop/           # System monitor
├── fish/           # Previous shell
├── ghostty/        # Terminal emulator
├── karabiner/      # Key remapper
├── nvim/           # Primary editor
├── tmux/           # Terminal multiplexer
├── yazi/           # File manager
├── zsh/            # Primary shell
└── starship.toml   # Cross-shell prompt
```

## Environment

| Tool | Highlights |
|------|------------|
| **Neovim** | Native `vim.pack` and `vim.lsp.config` (0.12+), `blink.cmp`, `snacks.nvim`, `heirline`, `oil`, `flash`, `conform`, and `nvim-dap` |
| **Ghostty** | `0.88` background opacity with blur, hidden titlebar, custom app icon, and GLSL cursor shaders |
| **tmux** | Vi copy-mode, live CPU/RAM/GPU status line, Yazi image passthrough, and `sessionx` / `floax` popups |
| **Fish** | `fzf` and `zoxide` integration, and `eza` aliases |
| **Zsh** | antidote with `zsh-autosuggestions`, `fzf-tab`, and deferred `fast-syntax-highlighting`; `fzf` and `zoxide` integration, and `eza` aliases |
| **Bash** | Vi-mode line editing, `fzf` integration, and shared aliases |
| **bat** | Catppuccin Mocha syntax highlighting for file previews |
| **Starship** | Single-line prompt displaying Git status metrics and runtime versions |
| **Yazi** | Default theme and inline image previews |
| **btop** | TTY theme with a transparent background and Vim-style navigation keys |

## Fonts

- **Berkeley Mono Variable** — Primary coding font
- **Maple Mono NF CN** — CJK and Nerd Font glyph fallback

## Key Bindings

| Key | Action |
|-----|--------|
| `Ctrl-h / j / k / l` | System-wide arrow keys (via Karabiner) |
| `Ctrl-p / Ctrl-n` | Navigate backward / forward in shell history |
| `Ctrl-a / Ctrl-e` | Jump to the start / end of the command line |
| `Alt-w` | Cut active selection in Fish and Zsh |
| `Ctrl-s` | tmux prefix |

## Installation

```bash
git clone https://github.com/D1376/dotfiles.git ~/.config
```

Plugin managers, LSP servers, and shell integrations are bootstrapped per tool—see each directory for details.
