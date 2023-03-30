---------------
-- Variables --
---------------

-- vim.o --> editor option
-- vim.bo --> buffer local option
-- vim.wo --> windows local option

-- enable compe
vim.o.completeopt = "menuone,noselect"

-- python path for neovim
-- vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim2/bin/python"
-- vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim3/bin/python"

vim.opt.mouse = "a" -- enable mouse

vim.opt.expandtab = true -- tabs are spaces
vim.opt.smarttab = false
vim.opt.tabstop = 8 -- number of visual space per TAB
vim.opt.shiftwidth = 2 -- number of space to use for autoindent
vim.opt.softtabstop = 2 -- number of space per TAB when editing
vim.opt.autoindent = true -- keep indent on <CR>
vim.opt.shiftround = true -- round indentation to a multiple of shiftwidth

-- visual
vim.opt.number = true -- show number
vim.opt.relativenumber = true -- disable relative number and keep line number
vim.opt.scrolloff = 4 -- minimal amount of line before and after the cursor when scrolling
vim.opt.sidescrolloff = 8 -- minimal amount of column to keep on the left and the right of the cursor
vim.opt.wrap = false -- disable line wrap
vim.opt.hls = false -- remove highlight search

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.netrw_altv = 1
vim.g.netrw_alto = 1

-- git
vim.g.gitgutter_enabled = true
vim.g.gitgutter_gitgutter_max_signs = 500
vim.g.gitgutter_highlight_linenrs = true

-- spelling
vim.opt.spelllang = "en_gb"

-- other
vim.opt.encoding = "utf-8"
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.shortmess:append({ c = true })
vim.opt.shortmess:remove({ "F" })

-- folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
