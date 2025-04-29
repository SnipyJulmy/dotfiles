return {
  {
    "nvimtools/none-ls.nvim",
    cond = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
      })
    end,
  },
}
