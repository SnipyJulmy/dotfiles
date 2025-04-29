return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = false,
          treesitter = true,
          fidget = true,
          notify = true,
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
      })
    end,
  },
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "glepnir/zephyr-nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "cpea2506/one_monokai.nvim" },
  {
    "diegoulloao/neofusion.nvim",
    config = true,
  },
}
