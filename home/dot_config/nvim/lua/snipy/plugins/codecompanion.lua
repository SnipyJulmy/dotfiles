return {
  {
    "olimorris/codecompanion.nvim",
    cond = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "GEMINI_API_KEY",
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "gemini",
          },
          inline = {
            adapter = "gemini",
          },
        },
      })
    end,
  },
}
