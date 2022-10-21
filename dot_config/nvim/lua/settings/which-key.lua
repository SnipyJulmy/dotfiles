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
  m = {
    name = "Harpoon",
    a = "Add file",
    m = "Menu",
    [","] = "Next",
    k = "Prev",
    ["1"] = "Nav file 1",
    ["2"] = "Nav file 2",
    ["3"] = "Nav file 3",
    ["4"] = "Nav file 4",
  },
  g = {
    name = "Lsp",
    D = { "Declaration" },
    d = { "Definition" },
    i = { "Implementation" },
    r = { "Regerences" },
    k = { "Signature help" },
    s = {
      name = "Lsp symbols",
      d = { "Document symbols" },
      w = { "Workspace symbols" },
    },
    p = {
      name = "Preview",
      d = { "Preview definition" },
      t = { "Preview type definition" },
      i = { "Preview implementation" },
      r = { "Preview references" },
      p = { "Close all preview" },
    },
  },
  K = { "Hover" },
  ["<space>"] = {
    name = "Space",
    W = {
      name = "Workspace",
      a = { "Add workspace folder" },
      r = { "Remove workspace folder" },
      l = { "List workspace folders" },
    },
    D = { "Type definition" },
    r = {
      name = "Refactor",
      n = "rename",
    },
    c = {
      name = "Action",
      a = "Code action",
      f = "Lsp format",
    },
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
      w = { name = "Word" },
      c = { name = "Char 1" },
      l = { name = "Lines" },
    },
    g = {
      name = "Git",
      g = { "Git" },
      p = {
        name = "Push",
        p = "Git push",
        f = "Git push --force-with-lease",
      },
      b = {
        name = "Git blame",
      },
    },
    ["]"] = {
      name = "Next",
      h = "Git Hunk",
      d = "Diagnostic",
    },
    ["["] = {
      name = "Previous",
      h = "Git Hunk",
      d = "Diagnostic",
    },
    f = {
      name = "Finder",
      f = { "Find file" },
      F = { "Find hidden file " },
      g = { "Grep" },
      l = { "Find work undur cursor" },
      b = { "Buffers" },
      h = { "Help tags" },
      s = { "LSP symbols" },
      m = { "Harpoon" },
      a = { "Man page" },
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
  ["<leader>"] = {
    c = {
      l = {
        name = "Codelens",
        r = "Refresh",
        u = "Run",
      },
    },
    g = {
      name = "Git",
      p = { "Preview hunk" },
      t = { "Toggle Gitgutter" },
    },
    h = {
      name = "Gitgutter",
      p = "Preview",
      s = "Stage",
      u = "Unstage",
    },
    ["leader"] = {
      r = { "Reload init.lua" },
      s = { "Reload current file" },
      l = { "Reload luasnip snippets" },
    },
  },
})
