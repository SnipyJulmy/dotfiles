-- enables the experimental Lua module loader
-- see :h vim.loader.enable()
vim.loader.enable()

-- set leader key to ',', this should happend before any plugin requirement
--
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

vim.keymap.set({ "n" }, "<F10>", "<cmd>wqa<CR>")

require("snipy.autocommands")
require("snipy.options")
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

require("snipy.theme")
require("snipy.dap")
require("snipy.global")
require("snipy.lsp-config")
require("snipy.mappings")
