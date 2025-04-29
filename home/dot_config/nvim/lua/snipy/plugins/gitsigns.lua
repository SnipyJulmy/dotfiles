return {
  {
    "lewis6991/gitsigns.nvim",
    cond = true,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        deleted = { text = "-" },
        topdelete = { text = "_" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        add = { text = "+" },
        change = { text = "~" },
        deleted = { text = "-" },
        topdelete = { text = "_" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signs_staged_enable = true,
      numhl = true,
      linehl = false,
      auto_attach = true,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set({ "n" }, "]g", gitsigns.next_hunk, { buffer = bufnr })
        vim.keymap.set({ "n" }, "[g", gitsigns.prev_hunk, { buffer = bufnr })
        vim.keymap.set({ "n" }, "<Space>gb", gitsigns.blame, { buffer = bufnr })
        vim.keymap.set({ "n" }, "B", function()
          gitsigns.blame_line({ full = true })
        end, { buffer = bufnr })

        vim.keymap.set({ "n" }, "<Space>gs", gitsigns.stage_hunk)
        vim.keymap.set({ "n" }, "<Space>gr", gitsigns.reset_hunk)

        vim.keymap.set({ "v" }, "<Space>gs", function()
          gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)

        vim.keymap.set({ "v" }, "<Space>gr", function()
          gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
      end,
    },
  },
}
