-- set leader key to ',', this should happend before any plugin requirement
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=main",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("snipy.plugins", {
  dev = { path = "~/plugins", fallback = false },
  change_detection = { enabled = false, notify = false },
})

require("snipy.global")
require("snipy.options")
require("snipy.theme")
require("snipy.autocommands")
require("snipy.lualine")
require("snipy.lsp-config")
require("snipy.nvim-cmp")
require("snipy.treesitter")
require("snipy.telescope")
require("snipy.dap")
require("snipy.neo-tree")
require("snipy.git")
require("snipy.mappings")
require("snipy.which-key")
