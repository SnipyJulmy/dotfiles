return {
  {
    "mfussenegger/nvim-dap",
    cond = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    cond = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    cond = false,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "ericpubu/lsp_codelens_extensions.nvim",
    cond = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("codelens_extensions").setup()
    end,
  },
}
