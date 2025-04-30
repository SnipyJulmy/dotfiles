vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "121"
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

---@type vim.lsp.Config
vim.lsp.config.taplo = {
  cmd = { "taplo", "lsp", "stdio" },
  filetypes = { "toml" },
  root_markers = { ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
}

vim.lsp.enable("taplo")
