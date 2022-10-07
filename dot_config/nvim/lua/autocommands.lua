local base_group = vim.api.nvim_create_augroup("BaseGroup", { clear = true })
local fmt = vim.api.nvim_create_augroup("Fmt", { clear = true })
local go = vim.api.nvim_create_augroup("Go", { clear = true })
local scala = vim.api.nvim_create_augroup("Metals", { clear = true })
local packer = vim.api.nvim_create_augroup("Packer", { clear = true })
local telescope = vim.api.nvim_create_augroup("Telescope", { clear = true })

-- vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = fmt, pattern = { "*.go", "*.lua", "*.rs", "*.py" }, command = "Neoformat" })

vim.api.nvim_create_autocmd(
  { "FileType" },
  { group = go, pattern = "go", command = "setlocal shiftwidth=8 softtabstop=8 expandtab omnifunc=v:lua.vim.lsp.omnifunc" }
)

vim.api.nvim_create_autocmd({ "FileType" }, { group = fmt, pattern = "bzl", command = "setlocal shiftwidth=4 softtabstop=4 expandtab" })
vim.api.nvim_create_autocmd({ "FileType" }, { group = fmt, pattern = "xml", command = "setlocal shiftwidth=4 softtabstop=4 expandtab" })
vim.api.nvim_create_autocmd({ "FileType" }, { group = fmt, pattern = "toml", command = "setlocal shiftwidth=4 softtabstop=4 expandtab" })

vim.api.nvim_create_autocmd({ "FileType" }, { group = scala, pattern = "scala", command = "setlocal omnifunc=v:lua.vim.lsp.omnifunc" })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = scala,
  pattern = { "*.scala", "*.sbt" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.scala.html" },
  command = "set filetype=scala",
  group = scala,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, { group = packer, pattern = "plugins.lua", command = "PackerCompile" })

vim.api.nvim_create_autocmd({ "FileType" }, { group = base_group, pattern = "harpoon", command = "setlocal wrap" })
vim.api.nvim_create_autocmd({ "FileType" }, { group = base_group, pattern = "markdown", command = "setlocal textwidth=120" })
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
  command = "set wrap linebreak nolist spell spelllang=en_us complete+=kspell",
  group = base_group,
})

vim.api.nvim_create_autocmd({ "FileType" }, { group = telescope, pattern = "TelescopePrompt", command = "inoremap <buffer> <silent> <C-r> <C-r>" })

-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { group = base_group, pattern = "*.conf", command = "set filetype=hocon" })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, { group = base_group, pattern = { "BUILD", "WORKSPACE" }, command = "set filetype=bzl" })
vim.api.nvim_create_autocmd({ "BufWritePost" }, { group = base_group, pattern = "~/.local/share/chezmoi/*", command = "! chezmoi apply --source-path %" })
