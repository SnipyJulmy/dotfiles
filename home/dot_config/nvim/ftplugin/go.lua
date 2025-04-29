local gofmt = vim.api.nvim_create_augroup("GoFormat", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = gofmt,
  pattern = "*.go",
  callback = require("go.format").gofmt,
})
