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
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          deleted = { text = "-" },
        },
        numhl = true,
      })
    end,
    vim.keymap.set({ "n" }, "B", "<cmd>Gitsigns blame_line<CR>"),
  },
  {
    "rhysd/git-messenger.vim",
    config = function()
      vim.g.git_messenger_no_default_mappings = true
      vim.keymap.set({ "n" }, "M", "<cmd>GitMessenger<CR>")
    end,
  },
  "rhysd/committia.vim",
}
