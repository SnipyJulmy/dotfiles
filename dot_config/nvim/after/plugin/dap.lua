local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup({})

-- stylua: ignore start
vim.keymap.set({ "n" }, "<Space>db",  function() dap.toggle_breakpoint() end)
vim.keymap.set({ "n" }, "<Space>do",  function() dap.repl.open() end)
vim.keymap.set({ "n" }, "<Space>dl",  function() dap.repl.run_last() end)
vim.keymap.set({ "n" }, "<F1>",       function() dap.continue() end)
vim.keymap.set({ "n" }, "<F2>",       function() dap.step_over() end)
vim.keymap.set({ "n" }, "<F3>",       function() dap.step_into() end)
vim.keymap.set({ "n" }, "<F4>",       function() dap.step_out() end)
vim.keymap.set({ "n" }, "<Space>duo", function() dapui.open() end)
vim.keymap.set({ "n" }, "<Space>duc", function() dapui.close() end)
vim.keymap.set({ "n" }, "<Space>dut", function() dapui.toggle() end)
-- stylua: ignore stop

local configs = {
  go = {
    {
      type = "go",
      name = "Debug commits",
      request = "launch",
      program = "${file}",
      args = { "generate", "../../../master", "release-v2022.6.2" },
    },
  },
  scala = {
    {
      type = "scala",
      request = "launch",
      name = "run",
      metals = {
        runType = "runOrTestFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "run with args",
      metals = {
        runType = "runOrTestFile",
        args = function()
          return vim.split(vim.fn.input("Args: "), " +")
        end,
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "test",
      metals = {
        runType = "testTarget",
      },
    },
  },
}

-- insert custom configurations into potentialy existing ones or create them
for lang, lang_configs in pairs(configs) do
  dap.configurations[lang] = dap.configurations[lang] or {}
  for _, config in pairs(lang_configs) do
    table.insert(dap.configurations[lang], config)
  end
end
