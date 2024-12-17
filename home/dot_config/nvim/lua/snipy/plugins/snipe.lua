return {
  {
    "leath-dub/snipe.nvim",
    keys = {
      {
        "ga",
        function()
          require("snipe").open_buffer_menu()
        end,
        desc = "Open Snipe buffer menu",
      },
    },
    opts = {},
  },
}
