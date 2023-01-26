local base_group = vim.api.nvim_create_augroup("BaseGroup", { clear = true })
-- local fmt = vim.api.nvim_create_augroup("Fmt", { clear = true })
-- local scala = vim.api.nvim_create_augroup("Metals", { clear = true })
local packer = vim.api.nvim_create_augroup("Packer", { clear = true })
local telescope = vim.api.nvim_create_augroup("Telescope", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, { group = fmt, pattern = { "*.go", "*.lua", "*.rs", "*.py" }, command = "FormatWrite" })

-- vim.api.nvim_create_autocmd({ "FileType" }, { group = scala, pattern = "scala", command = "setlocal omnifunc=v:lua.vim.lsp.omnifunc" })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = scala,
--   pattern = { "*.scala", "*.sbt" },
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*.scala.html" },
--   command = "set filetype=scala",
--   group = scala,
-- })

vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = packer, pattern = "plugins.lua", command = "PackerCompile" })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
  command = "set wrap linebreak nolist spell spelllang=en_us complete+=kspell",
  group = base_group,
})

vim.api.nvim_create_autocmd({ "FileType" }, { group = telescope, pattern = "TelescopePrompt", command = "inoremap <buffer> <silent> <C-r> <C-r>" })

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { group = base_group, pattern = "*.conf", command = "set filetype=hocon" })
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, { group = base_group, pattern = "~/.local/share/chezmoi/*", command = "! chezmoi apply --source-path %" })

-- yaml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, { group = base_group, pattern = { "*.yaml, *.yml" }, command = "setlocal filetype=yaml" })
