return {
  {
    "leoluz/nvim-dap-go",
    cond = false,
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "ray-x/go.nvim",
    cond = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = [[:lua require("go.install").update_all_sync()]],
  },
}
