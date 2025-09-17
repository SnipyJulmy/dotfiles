-- vim.o -> Editor option
-- vim.bo -> Buffer local option
-- vim.wo -> Windows local option
-- vim.env -> Environment variables defined in the editor session.

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- python path for neovim
-- vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim2/bin/python"
-- vim.g.python_host_prog = os.getenv("HOME") .. "/.pyenv/versions/neovim3/bin/python"

vim.opt.mouse = "n"

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.shiftround = true

-- visual
vim.opt.number = true -- show number
vim.opt.relativenumber = true
vim.opt.scrolloff = 4 -- minimal amount of line before and after the cursor when scrolling
vim.opt.sidescrolloff = 8 -- minimal amount of column to keep on the left and the right of the cursor
vim.opt.wrap = false
vim.opt.hls = false -- remove highlight search
vim.opt.winborder = "rounded"

-- windows
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.netrw_altv = 1
vim.g.netrw_alto = 1

vim.opt.spelllang = "en_gb"

vim.opt.encoding = "utf-8"
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"
vim.opt.shortmess:append({ c = true, I = true })
vim.opt.shortmess:remove({ "F" })
vim.bo.fixendofline = false

-- folding
vim.wo.foldenable = false
