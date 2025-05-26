-- enables the experimental Lua module loader
-- see :h vim.loader.enable()
vim.loader.enable()

---@diagnostic disable-next-line: duplicate-set-field
vim.deprecate = function() end -- disable deprecate messages

-- set leader key to ',', this should happen before any plugin requirement
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("snipy.mappings")
require("snipy.options")
require("snipy.autocommands")
require("snipy.diagnostic")

require("lazy").setup("snipy.plugins", {
  dev = {
    path = "~/plugins",
    fallback = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
})

require("snipy.global")
require("snipy.ui")

-- require("snipy.dap")
-- require("snipy.lsp-config")
