local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local always = function()
  return true
end

local never = function()
  return false
end

local colors = {
  bg = "#282828",
  bg0 = "#282828",
  bg1 = "#3c3836",
  bg2 = "#504945",
  bg3 = "#665c54",
  bg4 = "#7c6f64",

  fg = "#ebdbb2",
  fg0 = "#fbf1c7",
  fg1 = "#ebdbb2",
  fg2 = "#d5c4a1",
  fg3 = "#bdae93",
  fg4 = "#a89984",

  bgs = {
    aqua = "#689d6a",
    blue = "#458588",
    gray = "#a89984",
    green = "#98971a",
    orange = "#d65d0e",
    purple = "#b16286",
    red = "#cc241d",
    yellow = "#d79921",
  },

  fgs = {
    aqua = "#8ec07c",
    blue = "#83a598",
    gray = "#928374",
    green = "#b8bb26",
    orange = "#fe8019",
    purple = "#d3869b",
    red = "#fb4934",
    yellow = "#fabd2f",
  },
}

local mode = {

  init = function(self)
    self.mode = vim.fn.mode(1)
  end,

  static = {
    mode_mapping = {
      n = "normal",
      no = "op",
      nov = "op",
      noV = "op",
      ["no"] = "op",
      niI = "normal",
      niR = "normal",
      niV = "normal",
      nt = "normal",
      v = "visual",
      V = "visual_lines",
      [""] = "visual_block",
      s = "select",
      S = "select",
      [""] = "block",
      i = "insert",
      ic = "insert",
      ix = "insert",
      R = "replace",
      Rc = "replace",
      Rv = "v_replace",
      Rx = "replace",
      c = "command",
      cv = "command",
      ce = "command",
      r = "enter",
      rm = "more",
      ["r?"] = "confirm",
      ["!"] = "shell",
      t = "terminal",
      ["null"] = "none",
    },
  },

  provider = function(self)
    return string.format("%8s", self.mode_mapping[self.mode])
  end,
  hl = {
    fg = colors.fg,
    bg = colors.bg,
  },
  condition = always,
  on_click = nil,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

local statusline = {
  mode,
}

---@diagnostic disable-next-line: unused-local
local winbar = {}

---@diagnostic disable-next-line: unused-local
local tabline = {}

---@diagnostic disable-next-line: unused-local
local statuscolumn = {}

require("heirline").setup({
  statusline = statusline,
  winbar = nil,
  tabline = nil,
  statuscolumn = nil,
  opts = {},
})
