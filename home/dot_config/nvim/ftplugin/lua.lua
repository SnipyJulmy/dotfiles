local lua_group = vim.api.nvim_create_augroup("Lua", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = lua_group,
  pattern = { "*.lua" },
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
