return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters = {
        ktfmt = {
          command = [[ktfmt]],
          args = { "--google-style", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        sh = { "beautysh" },
        zsh = { "beautysh" },
        js = { "prettier" },
        -- kotlin = { "ktfmt" },
      },
      format_on_save = {
        lsp_fallback = false,
        timeout_ms = 500,
      },
      format_after_save = {
        lsp_fallback = false,
      },
      log_level = vim.log.levels.DEBUG,
    })
  end,
}
