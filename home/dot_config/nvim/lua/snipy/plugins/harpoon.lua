return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup({
        save_on_toggle = false,
        save_on_changes = true,
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })

      vim.keymap.set({ "n" }, "ma", require("harpoon.mark").add_file)
      vim.keymap.set({ "n" }, "mm", require("harpoon.ui").toggle_quick_menu)
      vim.keymap.set({ "n" }, "m,", require("harpoon.ui").nav_next)
      vim.keymap.set({ "n" }, "mk", require("harpoon.ui").nav_prev)

      for i = 1, 4 do
        vim.keymap.set({ "n" }, "m" .. i, function()
          require("harpoon.ui").nav_file(i)
        end)
      end
      require("telescope").load_extension("harpoon")
    end,
  },
}
