local wk = require("which-key")

wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = false,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {},
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "none",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",

  triggers_blacklist = {

    i = { "j", "k" },
    v = { "j", "k" },
  },
})

wk.register({
  ["<Space>"] = {
    name = "Space",
    d = {
      name = "Diagnostics / Debug",
      b = { name = "Toggle breakpoints" },
      l = { name = "Last run" },
      o = { name = "Open REPL" },
      u = {
        name = "Dap UI",
        o = { name = "Open" },
        c = { name = "Close" },
        t = { name = "Toggle" },
      },
      e = "Diagnostics line",
      q = "Diagnostics Loclist",
    },
    m = {},
    -- l = { name = "Lsp" },
    w = {
      name = "Hop",
    },
    g = {
      name = "Git",
      g = {},
    },
    f = {
      name = "Finder",
      f = { "Find file" },
      F = { "Find hidden file " },
      g = {},
    },
    F = {
      name = "Format",
    },
    q = {
      name = "Close current buffer",
    },
    e = {
      name = "Show diagnostics",
    },
  },
})
