return {
  {
    "mfussenegger/nvim-dap-python",
    cond = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-python").setup("python")
    end,
  },
}
