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
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      lsp_keymaps = false,
    },
    config = function(opts)
      require("go").setup(opts)
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = [[:lua require("go.install").update_all_sync()]],
  },
}
