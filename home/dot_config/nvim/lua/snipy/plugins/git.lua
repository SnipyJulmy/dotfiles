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
  "tpope/vim-fugitive",
  { "NeogitOrg/neogit", dependencies = "nvim-lua/plenary.nvim" },
  "lewis6991/gitsigns.nvim",
  {
    "rhysd/git-messenger.vim",
    config = function()
      vim.g.git_messenger_no_default_mappings = true
    end,
  },
  "rhysd/committia.vim",
  "sindrets/diffview.nvim",
}
