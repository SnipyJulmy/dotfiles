local textwidth = 120
local indentSize = 2

vim.opt_local.shiftwidth = indentSize
vim.opt_local.softtabstop = indentSize
vim.opt_local.expandtab = true
vim.opt_local.textwidth = textwidth
vim.opt_local.colorcolumn = tostring(textwidth + 1)
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

---@type vim.lsp.Config
vim.lsp.config.tinymist = {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {
    tinymist = {
      exportPdf = "never",
      formatterMode = "typstyle",
      formatterPrintWidth = textwidth,
      formatterIndentSize = indentSize,
    },
  },
}

vim.lsp.enable("tinymist")
