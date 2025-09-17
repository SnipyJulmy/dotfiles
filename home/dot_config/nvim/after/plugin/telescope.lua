addWhichKey({
  { "<space>f", group = "Telescope", mode = "n" },
  { "<space>ff", desc = "Find files", mode = "n" },
  { "<space>fg", desc = "Live grep", mode = "n" },
  { "<space>fh", desc = "Find help tag", mode = "n" },
  { "<space>fq", desc = "Find quickfix", mode = "n" },
  { "<C-p>", desc = "Find git files", mode = "n" },
})

local builtin = require("telescope.builtin")

vim.keymap.set({ "n" }, "<Space>ff", function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
  })
end)

vim.keymap.set({ "n" }, "<Space>fg", function()
  builtin.live_grep({})
end)

vim.keymap.set({ "n" }, "<C-p>", function()
  builtin.buffers({
    ignore_current_buffer = true,
  })
end)

vim.keymap.set({ "n" }, "<Space>fh", function()
  builtin.help_tags({})
end)

vim.keymap.set({ "n" }, "<Space>fq", function()
  builtin.quickfix({})
end)
