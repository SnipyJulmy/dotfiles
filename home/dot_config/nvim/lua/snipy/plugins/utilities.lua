return {
  {
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
      vim.keymap.set({ "n" }, "<C-g>", "<cmd>CccPick<CR>")
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "godlygeek/tabular",
  },
}
