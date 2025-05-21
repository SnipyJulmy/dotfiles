return {
  {
    "ms-jpq/coq_nvim",
    cond = false,
    branch = "coq",
    lazy = false,
    init = function()
      vim.g.coq_settings = {
        auto_start = true,
        clients = {
          lsp = {
            enabled = true,
          },
          tree_sitter = {
            enabled = true,
          },
        },
        keymap = {
          recommended = true,
          pre_select = true,
        },
      }
      vim.keymap.set({ "i" }, "<Esc>", [[ pumvisible() ? "\<C-e><Esc>" : "\<Esc>" ]], { expr = true, silent = true })
      vim.keymap.set({ "i" }, "<C-c>", [[ pumvisible() ? "\<C-e><C-c>" : "\<C-c>" ]], { expr = true, silent = true })
      vim.keymap.set({ "i" }, "<BS>", [[ pumvisible() ? "\<C-e><BS>" : "\<BS>" ]], { expr = true, silent = true })
      vim.keymap.set(
        { "i" },
        "<CR>",
        [[ pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>" ) : "\<CR>" ]],
        { expr = true, silent = true }
      )
      vim.keymap.set({ "i" }, "<Tab>", [[ pumvisible() ? "\<C-n>" : "\<Tab>" ]], { expr = true, silent = true })
      vim.keymap.set({ "i" }, "<S-Tab>", [[ pumvisible() ? "\<C-p>" : "\<S-Tab>" ]], { expr = true, silent = true })
    end,
  },
}
