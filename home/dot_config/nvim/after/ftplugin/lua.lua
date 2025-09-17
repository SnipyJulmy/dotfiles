local textwidth = 160
local indentSize = 2

vim.opt_local.tabstop = indentSize
vim.opt_local.softtabstop = indentSize
vim.opt_local.shiftwidth = indentSize
vim.opt_local.expandtab = true
vim.opt_local.textwidth = textwidth
vim.opt_local.colorcolumn = tostring(textwidth + 1)
