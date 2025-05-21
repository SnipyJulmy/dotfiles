return {
  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup({})
      vim.keymap.set({ "n" }, "<space>ww", [[<cmd>lua require("hop").hint_words({})<CR>]])
      vim.keymap.set({ "n" }, "<space>wc", [[<cmd>lua require("hop").hint_char1({})<CR>]])
      vim.keymap.set({ "n" }, "<space>wl", [[<cmd>lua require("hop").hint_lines({})<CR>]])
    end,
  },
}
