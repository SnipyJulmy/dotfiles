return {
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "text" },
        map_cr = true,
        map_complete = true,
      })
    end,
  },
}
