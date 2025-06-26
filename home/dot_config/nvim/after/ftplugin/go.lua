local textwidth = 120
local indentSize = 8

vim.opt_local.shiftwidth = indentSize
vim.opt_local.softtabstop = indentSize
vim.opt_local.expandtab = true
vim.opt_local.textwidth = textwidth
vim.opt_local.colorcolumn = tostring(textwidth + 1)
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

local root_markers = { "go.work", "go.mod", ".git" }

---@type vim.lsp.Config
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = root_markers,
  root_dir = function(bufnr, callback)
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local directories = vim.fs.find(root_markers, { path = filepath, upward = true })
    local root_dir = vim.fs.dirname(directories[1])
    notify("[gopls] root_dir is " .. root_dir)
    callback(root_dir)
  end,
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
}

vim.lsp.enable("gopls")
