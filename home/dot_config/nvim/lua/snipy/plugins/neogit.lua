return {
  {
    "NeogitOrg/neogit",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("neogit").setup({
        process_spinner = true,
      })

      vim.keymap.set({ "n" }, "<space>gg", require("neogit").open)
    end,
  },
}
