return {
  {
    "stevearc/oil.nvim",
    config = function()
      local oil = require("oil")
      oil.setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-s>"] = false,
          ["<C-x>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
          ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        },
        view_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set({ "n" }, "-", oil.open, { desc = "Open parent directory" })
    end,
  },
}
