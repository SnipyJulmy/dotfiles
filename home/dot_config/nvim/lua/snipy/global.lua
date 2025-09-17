function _G.number_open_buffer()
  return vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr("$")), "buflisted(v:val)"))
end

function _G.close_buffer()
  local nob = number_open_buffer()
  if nob > 1 then
    vim.api.nvim_exec2("bn|bd!#", { output = false })
  else
    vim.api.nvim_exec2("bd!", { output = false })
  end
end

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end

function _G.notify(...)
  require("notify")(...)
end

---@param f function
---@param table table
---@return table a new table which contains the element of table with f apply on them
function _G.fmap(f, table)
  local res = {}
  for k, v in pairs(table) do
    res[k] = f(v)
  end
  return res
end

---@param lhs table
---@param rhs table
---@return table return the union of lhs and rhs with the right table overwriting the left one
function _G.merge(lhs, rhs)
  local t3 = {}
  for i, v in ipairs(lhs) do
    t3[i] = v
  end
  for i, v in ipairs(rhs) do
    t3[i] = v
  end
  return t3
end

---@param table table the which key table containing the mapping to add to the which-key plugin
function _G.addWhichKey(table)
  if pcall(require, "which-key") then
    local wk = require("which-key")
    wk.add(table)
  end
end
