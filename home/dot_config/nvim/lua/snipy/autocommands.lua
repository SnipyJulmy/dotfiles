local yolo = vim.api.nvim_create_augroup("YoloGroup", { clear = true })
local telescope = vim.api.nvim_create_augroup("Telescope", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
  command = "set wrap linebreak nolist spell spelllang=en_us complete+=kspell",
  group = yolo,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = yolo,
  pattern = { "*.yaml, *.yml" },
  command = "setlocal filetype=yaml",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = telescope,
  pattern = "TelescopePrompt",
  command = "inoremap <buffer> <silent> <C-r> <C-r>",
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = yolo,
  pattern = "*.conf",
  command = "set filetype=hocon",
})
