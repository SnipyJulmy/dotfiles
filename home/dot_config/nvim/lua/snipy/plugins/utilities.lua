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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("window-picker").setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
                buftype = { "terminal" },
              },
            },
            other_win_hl_color = "#f4293f",
          })
        end,
      },
    },
  },
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        vim_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set({ "n" }, "-", require("oil").open, { desc = "Open parent directory" })
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
  "benmills/vimux",
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "light",
      })
    end,
  },
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set({ "n" }, "mb", require("buffer_manager.ui").toggle_quick_menu)
    end,
  },
  "folke/which-key.nvim",
}
