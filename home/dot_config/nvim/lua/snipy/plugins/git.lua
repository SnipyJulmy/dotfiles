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
  {
    "NeogitOrg/neogit",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup({})
      vim.keymap.set({ "n" }, "<Space>gg", require("neogit").open)
    end,
  },
  "rhysd/committia.vim",
}
