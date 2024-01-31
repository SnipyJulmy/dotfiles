local luafmt = vim.api.nvim_create_augroup("Lua", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = luafmt,
  pattern = { "*.lua" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
