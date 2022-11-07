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

require("pangolin.global")
require("pangolin.plugins")
require("pangolin.options")
require("pangolin.theme")
require("pangolin.autocommands")
require("pangolin.lualine")
require("pangolin.lsp")
require("pangolin.nvim-cmp")
require("pangolin.treesitter")
require("pangolin.telescope")
require("pangolin.dap")
require("pangolin.neo-tree")
require("pangolin.mappings")
require("pangolin.which-key")
