return {
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    event = "UiEnter",
    lazy = true,
    enabled = true,
    config = function()
      require("snipy.heirline").setup()
    end,
  },
}
