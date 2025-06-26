vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 100
vim.opt_local.colorcolumn = "101"
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

---@type vim.lsp.Config
vim.lsp.config.kotlin_lsp = {
  cmd = { "kotlin-ls", "--stdio" },
  filetypes = { "kotlin" },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  root_markers = {
    "build.gradle",
    "build.gradle.kts",
    "pom.xml",
  },
  workspace_required = false,
  settings = {},
}

-- vim.lsp.enable("kotlin_lsp")
