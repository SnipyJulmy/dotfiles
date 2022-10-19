local fn = vim.fn
local execute = vim.api.nvim_command

-- set leader key to ',', this should happend before any plugin requirement
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- auto install packer
local packer_install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer_install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. packer_install_path)
end

require("global")
require("plugins")
require("options")
require("theme")
require("autocommands")

require("settings.lualine")
require("settings.lsp")
require("settings.nvim-cmp")
require("settings.treesitter")
require("settings.telescope")
require("settings.dap")
require("settings.neo-tree")
require("settings.mappings")
require("settings.which-key")
