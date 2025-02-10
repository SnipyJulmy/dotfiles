return {
  {
    "ldelossa/gh.nvim",
    dependencies = {
      "ldelossa/litee.nvim",
    },
    config = function()
      require("litee.lib").setup()
      require("litee.gh").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set({ "n" }, "<Space>gb", "<cmd>Git blame<CR>")
    end,
  },
  "rhysd/committia.vim",
}
