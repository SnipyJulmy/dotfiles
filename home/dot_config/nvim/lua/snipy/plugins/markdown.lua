return {
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "light",
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "vimwiki" },
        enabled = true,
        latex = {
          enabled = false,
        },
      })
      vim.treesitter.language.register("markdown", "vimwiki")
      vim.keymap.set({ "n" }, "<leader>mm", require("render-markdown").toggle)
      vim.keymap.set({ "n" }, "<leader>me", require("render-markdown").enable)
      vim.keymap.set({ "n" }, "<leader>md", require("render-markdown").disable)
      vim.keymap.set({ "n" }, "<leader>mj", require("render-markdown").expand)
      vim.keymap.set({ "n" }, "<leader>mk", require("render-markdown").contract)
    end,
  },
}
