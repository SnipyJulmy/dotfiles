vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "121"
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

---@type vim.lsp.Config
vim.lsp.config.tinymist = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {
    tinymist = {
      exportPdf = "never",
      formatterMode = "typstyle",
    },
  },
}

vim.lsp.enable("tinymist")
