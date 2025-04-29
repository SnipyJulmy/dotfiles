---@type vim.lsp.Config
vim.lsp.config.vimls = {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  root_dir = function(bufnr, callback)
    local candidates = { ".git" }
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local root_dir = vim.fs.dirname(vim.fs.find(candidates, { path = filepath, upward = true })[1])
    callback(root_dir)
  end,
  settings = {
    vimls = {
      initializationOptions = {
        isNeovim = true,
        diagnostic = {
          enable = true,
        },
      },
    },
  },
}
vim.lsp.enable("vimls")
