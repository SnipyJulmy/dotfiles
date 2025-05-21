local textwidth = 120
local indentSize = 2

vim.opt_local.tabstop = indentSize
vim.opt_local.softtabstop = indentSize
vim.opt_local.shiftwidth = indentSize
vim.opt_local.expandtab = true
vim.opt_local.textwidth = textwidth
vim.opt_local.colorcolumn = tostring(textwidth + 1)

---@type vim.lsp.Config
vim.lsp.config.yamlls = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
  root_markers = { ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "./github/workflows/*",
      },
      validate = true,
      completion = true,
      hover = true,
    },
  },
}

vim.lsp.enable("yamlls")
