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
    opts = {
      ui = {
        max_height = -1,
        position = "cursor",
        open_win_override = {
          border = "rounded",
        },
        preselect_current = false,
        preselect = nil,
        text_align = "left",
      },
      hints = {
        dictionary = "asdfghjklqweruiop",
      },
      navigate = {
        next_page = "J",
        prev_page = "K",
        under_cursor = "<cr>",
        cancel_snipe = "<esc>",
        close_buffer = "D",
        open_vsplit = "V",
        open_split = "H",
        change_tag = "C",
      },
      sort = "default",
    },
  },
}
