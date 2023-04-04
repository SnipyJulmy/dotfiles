local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

local on_attach = function(lsp_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- lsp
  vim.keymap.set({ "n" }, "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set({ "n" }, "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ "n" }, "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set({ "n" }, "gk", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set({ "n" }, "gsd", vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set({ "n" }, "gsw", vim.lsp.buf.workspace_symbol, bufopts)

  vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, bufopts)

  vim.keymap.set({ "n" }, "<Space>Wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set({ "n" }, "<Space>Wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set({ "n" }, "<Space>Wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set({ "n" }, "<Space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set({ "n" }, "<Space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ "n" }, "<Space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set({ "n" }, "<Space>cf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  vim.keymap.set({ "n" }, "<leader>clr", vim.lsp.codelens.refresh, bufopts)
  vim.keymap.set({ "n" }, "<leader>clu", vim.lsp.codelens.run, bufopts)

  vim.keymap.set({ "n" }, "gpd", require("goto-preview").goto_preview_definition, bufopts)
  vim.keymap.set({ "n" }, "gpt", require("goto-preview").goto_preview_type_definition, bufopts)
  vim.keymap.set({ "n" }, "gpi", require("goto-preview").goto_preview_implementation, bufopts)
  vim.keymap.set({ "n" }, "gpr", require("goto-preview").goto_preview_references, bufopts)
  vim.keymap.set({ "n" }, "gpp", require("goto-preview").close_all_win, bufopts)
end

local shared_diagnostic_settings = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

M.group = lsp_group
M.on_attach = on_attach
M.diagnostic_settings = shared_diagnostic_settings
M.capabilities = capabilities

return M
