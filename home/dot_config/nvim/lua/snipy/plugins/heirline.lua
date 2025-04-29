return {
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
    },
    event = "UiEnter",
    priority = 1100,
    lazy = true,
    config = function()
      require("snipy.heirline").setup()
    end,
  },
}
