---@type vim.lsp.Config
vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*(.sh|.inc|.bash|.command)",
    },
  },
}

vim.lsp.enable("bashls")
