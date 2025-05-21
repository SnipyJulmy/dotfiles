local textwidth = 120
local indentSize = 8

vim.opt_local.shiftwidth = indentSize
vim.opt_local.softtabstop = indentSize
vim.opt_local.expandtab = true
vim.opt_local.textwidth = textwidth
vim.opt_local.colorcolumn = tostring(textwidth + 1)
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

---@type vim.lsp.Config
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
}

vim.lsp.enable("gopls")
