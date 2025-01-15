return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        deleted = { text = "-" },
      },
      numhl = true,
      auto_attach = true,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.cmd("redrawstatus")

        vim.keymap.set({ "n" }, "B", gitsigns.blame_line, { buffer = bufnr })
        vim.keymap.set({ "n" }, "]g", gitsigns.next_hunk, { buffer = bufnr })
        vim.keymap.set({ "n" }, "[g", gitsigns.prev_hunk, { buffer = bufnr })
      end,
    },
  },
}
