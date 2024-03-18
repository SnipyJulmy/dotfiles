local M = {}

local default_config = {
  newline = "\n",
}

M.register = function(name)
  notify("Register formatter " .. name)
end

M.format = function() end

local function format_file(config, formatter)
  local error_file = vim.fn.tempname()
  local command = formatter.command()
  local bufnr = vim.fn.bufnr("%")

  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, true), config.newline)

  -- append a newline to the input if eol is enabled
  if vim.api.nvim_buf_get_option(bufnr, "eol") then
    input = input .. config.newline
  end

  -- execute the command with the buffer content
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

return M
