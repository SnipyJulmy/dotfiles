local utils = {}

function utils.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function utils.nomap(mode, lhs)
  vim.api.nvim_del_keymap(mode, lhs)
end

function utils.split(str, sep)
  local t = {}
  for match in (str .. sep):gmatch("(.-)" .. sep) do
    table.insert(t, match)
  end
  return t
end

function utils.getOrElse(nullable, default)
  if nullable then
    return nullable
  else
    return default
  end
end

function utils.get_current_filename()
  return vim.fn.expand("%:t")
end

function utils.fmap(table, lambda)
  local r = {}
  for i = 1, #table do
    r[#r + 1] = lambda(table[i])
  end
  return r
end

function utils.has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function utils.feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return utils
