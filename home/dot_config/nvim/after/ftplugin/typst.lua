local lsp = require("snipy.lsp")

vim.opt_local.shiftwidth = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "121" -- set right margin ruler
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

require("lspconfig").tinymist.setup({
  cmd = { "tinymist" },
  filetypes = { "typst" },
  single_file_support = true,
  settings = {
    formatterMode = "typstyle",
  },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities,
})
