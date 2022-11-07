vim.g.catppuccin_flavour = "macchiato"
require("catppuccin").setup()

vim.opt.termguicolors = true -- true color support
vim.opt.background = "dark"

vim.api.nvim_command([[colorscheme gruvbox]])

vim.cmd([[highlight Normal guibg=None]])
vim.cmd([[highlight WinSeparator guibg=None]])

vim.go.guicursor = nil
vim.opt.laststatus = 3 -- global statusline

-- vim.opt.cmdheight = 1 -- height of below command status line

vim.opt.colorcolumn = "160" -- set right margin ruler
