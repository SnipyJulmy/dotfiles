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
        latex = {
          enabled = false,
        },
      })
      vim.treesitter.language.register("markdown", "vimwiki")
    end,
  },
}
