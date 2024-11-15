return {
  {
    "rebelot/heirline.nvim",
    enabled = true,
    config = function()
      local statusline = {}
      local winbar = {}
      local tabline = {}
      require("heirline").setup({
        statusline = statusline,
        winbar = winbar,
        tabline = tabline,
        opts = {
          disable_winbar_cb = function()
            return true
          end,
        },
      })
    end,
  },
}
