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
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gowork", "gotmpl" },
    build = [[:lua require("go.install").update_all_sync()]],
  },
}
