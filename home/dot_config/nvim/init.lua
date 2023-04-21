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

require("snipy.global")
require("snipy.plugins")
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
