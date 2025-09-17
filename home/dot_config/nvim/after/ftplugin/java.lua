vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 120
vim.opt_local.colorcolumn = "121"
vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"

local capabilities = require("snipy.lsp.capabilities")
local on_attach = require("snipy.lsp.on_attach")

local config = {
  cmd = { "jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set({ "n" }, "<leader><leader>j", function()
      vim.ui.select({ "jol", "jshell", "javap" }, {
        prompt = "Select jdtls tool to run",
        format_item = function(item)
          return item
        end,
      }, function(choice)
        if choice == "jshell" then
          require("jdtls").jshell()
        elseif choice == "jol" then
          require("jdtls").jol()
        elseif choice == "javap" then
          require("jdtls").javap()
        else
          if choice then
            notify("Unknown jdtls choice : " .. choice)
          end
        end
      end)
    end)
    vim.keymap.set({ "n" }, "<Space>jdi", require("jdtls").organize_imports, bufopts)
  end,
}

require("jdtls").start_or_attach(config)
