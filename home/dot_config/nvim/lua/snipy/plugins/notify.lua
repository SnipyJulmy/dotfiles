return {
  {
    "rcarriga/nvim-notify",
    cond = true,
    lazy = false,
    config = function()
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
}
