local sign_error = ""
local sign_warn = ""
local sign_info = "󰌵"
local sign_hint = "󰋽"

vim.fn.sign_define("DiagnosticSignError", { text = sign_error })
vim.fn.sign_define("DiagnosticSignWarn", { text = sign_warn })
vim.fn.sign_define("DiagnosticSignInfo", { text = sign_info })
vim.fn.sign_define("DiagnosticSignHint", { text = sign_hint })

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
