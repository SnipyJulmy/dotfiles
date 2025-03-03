return {
  {
    "NeogitOrg/neogit",
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neogit").setup({})

      vim.keymap.set({ "n" }, "<leader>gg", require("neogit").open)
      vim.keymap.set({ "n" }, "<leader>gc", function()
        require("neogit").open({ "commit", kind = "split_above_all" })
      end)
    end,
  },
}
