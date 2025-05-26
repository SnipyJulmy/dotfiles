local capabilities = require("snipy.lsp.capabilities")
local on_attach = require("snipy.lsp.on_attach")

vim.o.completeopt = "menuone,noselect,popup"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    on_attach(client, event.buf)
  end,
})

---@type vim.lsp.Config
vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = capabilities,
})
