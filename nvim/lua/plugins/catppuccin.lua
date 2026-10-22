require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  float = {
    transparent = true,
  },
  no_italic = true,
  term_colors = true,
  auto_integrations = true,
  integrations = {
    aerial = true,
    blink_cmp = true,
    dap = true,
    dap_ui = true,
    flash = true,
    gitsigns = true,
    lsp_saga = true,
    mason = true,
    mini = true,
    render_markdown = true,
    snacks = true,
    which_key = true,
  },
}
vim.cmd.colorscheme 'catppuccin-mocha'
