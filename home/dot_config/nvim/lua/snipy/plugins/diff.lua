return {
  {
    "Bleksak/diffthis.nvim",
    opts = {
      keys = {
        toggle = "<leader>dd",
        obtain = "do",
        put = "dp",
        next = "dn",
        prev = "dN",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        use_icons = true,
        view = {
          default = {
            layout = "diff2_horizontal",
            winbar_info = false,
          },
          merge_tool = {
            layout = "diff3_horizontal",
            disable_diagostics = true,
            winbar_info = true,
          },
        },
        keymaps = {
          disable_defaults = false,
          view = {},
          diff1 = {},
          diff2 = {},
          diff3 = {},
          diff4 = {},
        },
        file_panel = {
          listing_style = "list",
          win_config = {
            position = "left",
            width = 50,
            win_opts = {},
          },
        },
      })
      vim.keymap.set({ "n" }, "<Space>dvo", "<cmd>DiffviewOpen<CR>")
      vim.keymap.set({ "n" }, "<Space>dvc", "<cmd>DiffviewClose<CR>")
      vim.keymap.set({ "n" }, "<Space>dvt", "<cmd>DiffviewToggleFiles<CR>")
      vim.keymap.set({ "n" }, "<Space>dvf", "<cmd>DiffviewFocusFiles<CR>")
      vim.keymap.set({ "n" }, "<Space>dvr", "<cmd>DiffviewRefresh<CR>")
    end,
  },
}
