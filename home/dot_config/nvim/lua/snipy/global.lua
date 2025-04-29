function _G.number_open_buffer()
  return vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr("$")), "buflisted(v:val)"))
end

function _G.close_buffer()
  local nob = number_open_buffer()
  if nob > 1 then
    vim.api.nvim_exec("bn|bd!#", false)
  else
    vim.api.nvim_exec("bd!", false)
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
---@param tbl table
---@return table a new table which contains the element of tbl with f apply on them
function _G.fmap(f, tbl)
  local res = {}
  for k, v in pairs(tbl) do
    res[k] = f(v)
  end
  return res
end

---@param t1 table
---@param t2 table
---@return table t1 and t2 merge together with t2 having an higher priority
function _G.merge(t1, t2)
  local t3 = {}
  for i, v in ipairs(t1) do
    t3[i] = v
  end
  for i, v in ipairs(t2) do
    t3[i] = v
  end
  return t3
end
