---@diagnostic disable: unused-local, unused-function

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = require("snipy.heirline.colors")

local always = function()
  return true
end

local never = function()
  return false
end

local space = { provider = " " }
local align = { provider = "%=" }
local null = { provider = "" }
local fill = { provider = "%<" }
local os_sep = package.config:sub(1, 1)

local mode_indicator
do
  local mode_labels_map = setmetatable({
    normal = { name = "normal", color = colors.orange, bold = true },
    insert = { name = "insert", color = colors.blue, bold = true },
    visual = { name = "visual", color = colors.yellow, bold = true },
    visual_lines = { name = "visual", colors = colors.yellow, bold = true },
    visual_block = { name = "visual", colors = colors.yellow, bold = true },
    select = { name = "select", color = colors.blue, bold = true },
    replace = { name = "replace", color = colors.red, bold = true },
    command = { name = "command", color = colors.green, bold = true },
    terminal = { name = "terminal", color = colors.aqua, bold = true },
    op = { name = "op", color = colors.purple, bold = true },
    none = { name = "", color = colors.bg, bold = true },
  }, {
    __call = function(self, raw_mode)
      return self[raw_mode] or self.none
    end,
  })

  local mode_names_map = setmetatable({
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
  }, {
    __call = function(self, raw_mode)
      return self[raw_mode] or "none"
    end,
  })

  mode_indicator = {
    static = {
      mode_names_map = mode_names_map,
      mode_labels_map = mode_labels_map,
    },
    init = function(self)
      self.mode = self.mode_names_map(vim.fn.mode(1))
      self.label = self.mode_labels_map(self.mode)
    end,
    condition = function()
      return vim.bo.buftype == ""
    end,
    update = {
      "ModeChanged",
      pattern = "*:*",
      callback = vim.schedule_wrap(function()
        vim.cmd.redrawstatus()
      end),
    },
    {
      hl = { bg = colors.bg },
      utils.surround({ "", "" }, function(self)
        return self.label.color
      end, {
        {
          provider = function()
            if not vim.bo.modifiable or vim.bo.readonly then
              return ""
            else
              return ""
            end
          end,
          hl = function(self)
            if not vim.bo.modifiable or vim.bo.readonly then
              return { fg = colors.red, bg = self.label.color }
            else
              return { fg = colors.bg, bg = self.label.color }
            end
          end,
        },
        space,
        {
          provider = function(self)
            local label = self.mode_labels_map(self.mode)
            return string.format("%8s", string.upper(label.name))
          end,
        },
        hl = function(self)
          return { bg = self.label.color, fg = colors.bg }
        end,
      }),
    },
  }
end

local filepath_block
do
  local file_icon = {
    init = function(self)
      local filename = self.filename
      local ext = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, ext, { default = true })
    end,
    provider = function(self)
      return self.icon
    end,
    hl = function(self)
      return { bg = colors.bg, fg = self.icon_color }
    end,
  }

  local workdir = {
    provider = function(self)
      return self.workdir
    end,
    hl = { bg = colors.bg, fg = colors.grey0 },
    null,
  }

  local filepath = {
    provider = function(self)
      return self.filepath
    end,
    hl = { bg = colors.bg, fg = colors.green },
    null,
  }

  local filename = {
    provider = function(self)
      return self.filename
    end,
    hl = { bg = colors.bg, fg = colors.yellow },
    null,
  }

  local help_filename = {
    condition = function()
      return vim.bo.filetype == "help"
    end,
    provider = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
    end,
    hl = { bg = colors.bg, fg = colors.green },
  }

  filepath_block = {
    { file_icon, space, workdir, filepath, filename },
    fill,
  }
end

local git
do
  local branch_name = {
    provider = function(self)
      return self.status.head
    end,
    hl = { bold = true },
  }

  local added = {
    condition = function(self)
      return (self.status.added or 0) > 0
    end,
    provider = function(self)
      return string.format("%s", self.status.added)
    end,
    hl = { fg = colors.dark_green },
  }

  local changed = {
    condition = function(self)
      return (self.status.changed or 0) > 0
    end,
    provider = function(self)
      return string.format("~%s", self.status.changed)
    end,
    hl = { fg = colors.dark_blue },
  }

  local removed = {
    condition = function(self)
      return (self.status.removed or 0) > 0
    end,
    provider = function(self)
      return string.format("-%s", self.status.removed)
    end,
    hl = { fg = colors.dark_red },
  }

  git = {
    condition = function()
      return vim.b.gitsigns_status_dict
    end,
    update = {
      "User",
      pattern = "GitSignsUpdate",
      callback = vim.schedule_wrap(function()
        vim.cmd.redrawstatus()
      end),
    },
    init = function(self)
      self.status = vim.b.gitsigns_status_dict
      self.changes = self.status.added ~= 0 or self.status.removed ~= 0 or self.status.changed ~= 0
    end,
    -- hl = { bg = colors.bg, fg = colors.orange },
    {
      hl = { bg = colors.bg },
      utils.surround({ "", "" }, function(self)
        local head = self.status.head:lower()
        if head == "master" or head == "main" then
          return colors.bg_green
        elseif head == "dev" or head == "develop" then
          return colors.blue
        else
          return colors.bg_yellow
        end
      end, {
        hl = { fg = colors.bg3 },
        { provider = "" },
        space,
        {
          branch_name,
        },
        {
          condition = function(self)
            return self.changes
          end,
          { provider = "(" },
          added,
          changed,
          removed,
          { provider = ")" },
        },
      }),
    },
  }
end

local diagnostic
do
  local icons = vim.diagnostic.config(nil).signs.text
  diagnostic = {
    condition = function()
      return #vim.diagnostic.get(0) > 0
    end,
    static = {
      error_icon = icons[vim.diagnostic.severity.ERROR],
      warn_icon = icons[vim.diagnostic.severity.WARN],
      info_icon = icons[vim.diagnostic.severity.INFO],
      hint_icon = icons[vim.diagnostic.severity.HINT],
    },
    init = function(self)
      self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      self.infos = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { "DiagnosticChanged", "BufEnter" },
    {
      provider = function(self)
        return self.errors > 0 and string.format("%s%s", self.error_icon, self.errors)
      end,
      hl = { fg = colors.red },
    },
    space,
    {
      provider = function(self)
        return self.warnings > 0 and string.format("%s%s", self.warn_icon, self.warnings)
      end,
      hl = { fg = colors.orange },
    },
    space,
    {
      provider = function(self)
        return self.hints > 0 and string.format("%s%s", self.hint_icon, self.hints)
      end,
      hl = { fg = colors.blue },
    },
    space,
    {
      provider = function(self)
        return self.infos > 0 and string.format("%s%s", self.info_icon, self.infos)
      end,
      hl = { fg = colors.green },
    },
  }
end

local lsp
do
  lsp = {
    static = {
      colors = setmetatable({
        lua_ls = colors.dark_blue,
        vimls = colors.aqua,
        metals = colors.red,
      }, {
        __call = function(self, key)
          return self[key] or colors.dark_blue
        end,
      }),
    },
    condition = conditions.lsp_attached,
    -- update = { "LspAttach", "LspDetach" },
    init = function(self)
      self.clients = fmap(function(client)
        return client.name
      end, vim.lsp.get_clients({ bufnr = 0 }))
    end,
    provider = function(self)
      if #self.clients > 1 then
        return string.format("(%s)", table.concat(self.clients, " "))
      else
        return string.format("(%s)", table.concat(self.clients, " "))
      end
    end,
    hl = function(self)
      if #self.clients > 1 then
        return { fg = colors.dark_blue, bold = true }
      else
        return { fg = self.colors(self.clients[1]), bold = true }
      end
    end,
  }
end

local file_properties
do
  local filetype = {
    provider = function(self)
      return self.filetype:lower()
    end,
    hl = { bg = colors.bg, fg = colors.aqua, bold = true },
  }

  local encoding = {
    provider = function(self)
      return self.encoding:upper()
    end,
  }

  local format = {
    provider = function(self)
      if self.fileformat == "dos" then
        return ""
      elseif self.fileformat == "mac" then
        return ""
      else
        return ""
      end
    end,
  }

  file_properties = {
    filetype,
    space,
    encoding,
    space,
    format,
  }
end

local ruler = {
  provider = "%l:%c",
}

local statusline = {
  hl = { bg = colors.bg, fg = colors.fg },
  init = function(self)
    local path = vim.api.nvim_buf_get_name(0)
    local pwd = vim.fn.getcwd(0)
    local name

    if path == "" then
      pwd = vim.fn.fnamemodify(pwd, ":~") .. "/"
      path = nil
      name = "[No Name]"
    elseif path:find(pwd, 1, true) then
      name = vim.fn.fnamemodify(path, ":t")
      path = vim.fn.fnamemodify(path, ":~:.:h")
      pwd = vim.fn.fnamemodify(pwd, ":~") .. os_sep
      if path == "." then
        path = nil
      else
        path = path .. os_sep
      end
    else
      pwd = nil
      name = vim.fn.fnamemodify(path, ":t")
      path = vim.fn.fnamemodify(path, ":~:.:h") .. os_sep
    end

    self.workdir = pwd
    self.filepath = path
    self.filename = name
    self.filetype = vim.bo.filetype
    self.encoding = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
    self.fileformat = vim.bo.fileformat:lower()
  end,
  mode_indicator,
  space,
  filepath_block,
  align,
  git,
  align,
  diagnostic,
  align,
  lsp,
  align,
  ruler,
  space,
  file_properties,
}

return statusline
