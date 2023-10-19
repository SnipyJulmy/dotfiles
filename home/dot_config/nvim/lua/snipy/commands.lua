local popup = require("plenary.popup")

local function create_input_window()
  local width = 60
  local height = 10
  local borderchars = { "-", "|", "-", "|", "+", "+", "+", "+" }
  local bufnr = vim.api.nvim_create_buf(false, true)
  local win_id, win = popup.create(bufnr, {
    title = "Macro text",
    highlight = "Normal",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
  })
  vim.api.nvim_win_set_option(win.border.win_id, "winhl", "Border")

  return { bufnr = bufnr, win_id = win_id }
end

vim.api.nvim_create_user_command("For", function(args)
  local n = args.fargs[1]

  vim.ui.input({
    prompt = "Macro text",
  }, function(input)
    dump(input)
    local lines = { "Hello", "World !" }
    local buffer = vim.api.nvim_get_current_buf()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local s = cursor[1]
    local e = s + #lines

    for i = 0, n, 1 do
      vim.api.nvim_buf_set_lines(buffer, s, e, false, lines)
      s = e + 1
      e = s + #lines
    end
  end)
end, { nargs = 1 })
