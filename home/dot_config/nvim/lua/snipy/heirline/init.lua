if not pcall(require, "heirline") then
  return
end

vim.o.showmode = false

local statusline = require("snipy.heirline.statusline")

local winbar = nil

local tabline = nil

local statuscolumn = nil

local M = {}

function M.setup()
  vim.o.showmode = false
  require("heirline").setup({
    statusline = statusline,
    winbar = winbar,
    tabline = tabline,
    statuscolumn = statuscolumn,
    opts = {},
  })
end

return M
