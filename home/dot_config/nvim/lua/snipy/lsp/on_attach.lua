---@param client vim.lsp.Client the client that is attached to the lsp
---@param bufnr number that the lsp is attached to
local function on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set({ "n" }, "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set({ "n" }, "gT", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set({ "n" }, "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ "n" }, "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set({ "n" }, "gk", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set({ "n" }, "gsd", vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set({ "n" }, "gsw", vim.lsp.buf.workspace_symbol, bufopts)

  vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, bufopts)

  vim.keymap.set({ "n" }, "<Space>ch", function()
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    else
      notify("Server " .. client.name .. " does not support inlay hint provider")
    end
  end)

  vim.keymap.set({ "n" }, "<Space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ "n", "v" }, "<Space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set({ "n" }, "<Space>cf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  vim.keymap.set({ "n" }, "<Space>cl", vim.lsp.codelens.run)

  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
end

return on_attach
