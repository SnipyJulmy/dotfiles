vim.keymap.set({ "n" }, "ma", function()
  require("harpoon.mark").add_file()
end)
vim.keymap.set({ "n" }, "mm", function()
  require("harpoon.ui").toggle_quick_menu()
end)
vim.keymap.set({ "n" }, "m,", function()
  require("harpoon.ui").nav_next()
end)
vim.keymap.set({ "n" }, "mk", function()
  require("harpoon.ui").nav_prev()
end)

for i = 1, 4 do
  vim.keymap.set({ "n" }, "m" .. i, function() require("harpoon.ui").nav_file(i) end)
end
