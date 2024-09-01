return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("whick-key").show({ global = false })
        end,
      },
      desc = "Buffer Local Keymaps (which-key)",
    },
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<space>f", group = "Telescope" },
        { "<space>ff", group = "Find file" },
      })
    end,
  },
}
