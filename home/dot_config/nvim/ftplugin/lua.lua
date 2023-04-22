local lua_group = vim.api.nvim_create_augroup("Lua", { clear = true })
local instant_group = vim.api.nvim_create_augroup("Instant", { clear = true })
local newline = "\n"

local function create_error_window(errors)
  local bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, errors)

  local win_width = math.min(80, vim.o.columns - 4)
  local win_height = math.min(10, vim.o.lines - 4)
  local win_row = math.floor((vim.o.lines - win_height) / 2)
  local win_col = vim.o.columns - win_width - 2

  local win_id = vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = win_row,
    col = win_col,
    anchor = "NE",
    focusable = true,
    style = "minimal",
  })

  -- Set the floating window's options to make it look like an error message
  vim.api.nvim_win_set_option(win_id, "wrap", false)
  vim.api.nvim_win_set_option(win_id, "number", false)
  vim.api.nvim_win_set_option(win_id, "cursorline", false)
  vim.api.nvim_win_set_option(win_id, "signcolumn", "no")
  vim.api.nvim_win_set_option(win_id, "winblend", 0)

  vim.api.nvim_set_current_win(win_id)

  vim.api.nvim_buf_attach(bufnr, false, {
    on_changedtick = function()
      require("notify")("Close")
      vim.api.nvim_win_close(win_id, true)
    end,
  })
end

local function format_file()
  local error_file = vim.fn.tempname()
  local flags = "--search-parent-directories"
  local command = string.format("stylua %s - 2> %s", flags, error_file)
  local bufnr = vim.fn.bufnr("%")
  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, true), newline)
  if vim.api.nvim_buf_get_option(bufnr, "eol") then
    input = input .. newline
  end
  local output = vim.fn.system(command, input)
  if vim.fn.empty(output) == 0 then
    if output ~= input then
      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.split(output, newline))
    end
  else
    local errors = vim.fn.readfile(error_file)
    -- create_error_window(errors)
    require("notify")("Unable to format current file with stylua", "error", { title = "Hello" })
  end

  vim.fn.delete(error_file)
end

local function format_range()
  -- TODO
end

local function check_file()
  -- TODO
end

---@private
--- Creates autocommands to close a preview window when one of given events happen.
---
--- @param events table list of events
--- @param win_id integer id of the preview window
--- @param bufnrs table list of integer of buffer ids where the preview window will remain visible
local function close_preview_autocmd(events, win_id, bufnrs)
  local augroup = vim.api.nvim_create_augroup("preview_window_" .. win_id, { clear = true })

  -- close the preview window
  vim.api.nvim_create_autocmd("BufEnter", {
    group = augroup,
    callback = function()
      close_preview_window(win_id, bufnrs)
    end,
  })

  if #events > 0 then
    vim.api.nvim_create_autocmd(events, { group = augroup, buffer = bufnrs })
  end
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = lua_group,
  pattern = { "*.lua" },
  callback = function()
    format_file()
  end,
})
