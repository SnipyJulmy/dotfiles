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

function _G.fmap(f, tbl)
  local res = {}
  for k, v in pairs(tbl) do
    res[k] = f(v)
  end
  return res
end
