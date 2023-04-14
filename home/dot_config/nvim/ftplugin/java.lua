local lsp = require("snipy.lsp")

local on_attach = function(lsp_client, bufnr)
  lsp.on_attach(lsp_client, bufnr)

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set({ "n" }, "<leader><leader>j", function()
    vim.ui.select({ 'jol', "jshell", "javap" }, {
        prompt = 'Select jdtls tool to run',
        format_item = function(item) return item end
      },
      function(choice)
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
end

local config = {
  cmd = { 'jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  capabilities = lsp.capabilities,
  on_attach = on_attach,
}

require('jdtls').start_or_attach(config)
