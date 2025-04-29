return {
  {
    "ellisonleao/glow.nvim",
    cond = false,
    opts = {
      style = "light",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    cond = false,
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      -- "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("render-markdown").setup({
        file_types = { "markdown", "vimwiki" },
        enabled = false,
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
  {
    "toppair/peek.nvim",
    cond = false,
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "Kicamon/markdown-table-mode.nvim",
    cond = false,
    config = function()
      require("markdown-table-mode").setup({
        filetype = { "*.md" },
        options = {
          insert = true,
          insert_leave = true,
          pad_separator_line = false,
          alig_style = "default", -- left/center/right/default
        },
      })
    end,
  },
}
