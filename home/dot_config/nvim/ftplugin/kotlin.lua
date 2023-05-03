local lsp = require("snipy.lsp")
local util = require("lspconfig").util

local on_attach = function(lsp_client, bufnr)
  lsp.on_attach(lsp_client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
end

require("lspconfig").kotlin_language_server.setup({
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_dir = util.root_pattern("settings.gradle", "build.gradle.kts", "settings.gradle.kts"),
  on_attach = on_attach,
  capabilities = lsp.capabilities,
})