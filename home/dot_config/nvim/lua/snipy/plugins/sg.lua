return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("sg").setup({
        on_attach = require("snipy.lsp").on_attach,
      })

      local commands = require("sg.cody.commands")

      vim.keymap.set({ "n" }, "<Space>ii", "<cmd>CodyToggle<CR>", { desc = "Toggle Cody chat" })
      vim.keymap.set({ "v" }, "<Space>ia", "<cmd>CodyExplain<CR>", { desc = "Ask Cody a question about the selection" })
    end,
  },
}
