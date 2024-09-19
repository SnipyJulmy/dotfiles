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
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-s>"] = false,
          ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        },
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set({ "n" }, "-", oil.open, { desc = "Open parent directory" })
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  "tpope/vim-obsession",
  "chrisbra/unicode.vim",
  "godlygeek/tabular",
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set({ "n" }, "mb", require("buffer_manager.ui").toggle_quick_menu)
    end,
  },
  "folke/which-key.nvim",
}
