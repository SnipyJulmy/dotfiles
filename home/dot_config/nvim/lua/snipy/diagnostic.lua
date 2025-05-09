local sign_error = ""
local sign_warn = ""
local sign_info = "󰌵"
local sign_hint = "󰋽"

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = sign_error,
      [vim.diagnostic.severity.WARN] = sign_warn,
      [vim.diagnostic.severity.HINT] = sign_hint,
      [vim.diagnostic.severity.INFO] = sign_info,
    },
  },
})
