return {
  {
    "rebelot/heirline.nvim",
    config = function()
      require("heirline").setup({
        statusline = {},
        winbar = {},
        tabline = {},
        opts = {
          disable_winbar_cb = function()
            return true
          end,
        },
      })
    end,
  },
}
