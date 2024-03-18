return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  "morhetz/gruvbox",
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
      })
    end,
  },
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",
  "rebelot/kanagawa.nvim",
  {
    "glepnir/zephyr-nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  "cpea2506/one_monokai.nvim",
  "judaew/ronny.nvim",
}
