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
        diktat = {
          command = [[diktat]],
          args = {},
          stdin = false,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- python = { "black" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        zsh = { "beautysh" },
        js = { "prettier" },
        -- json = { "fixjson" },
        -- yaml = { "yamllint" },
        typst = { "typstyle" },
        terraform = function(_)
          if vim.fn.executable("terraform") == 1 then
            return { "terraform_fmt" }
          else
            return {}
          end
        end,
        rust = { "rustfmt", lsp_format = "fallback" },
        go = { "gofmt" },
        toml = { "taplo" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
      format_after_save = {
        lsp_fallback = true,
      },
      log_level = vim.log.levels.DEBUG,
    })
  end,
}
