local neogit = require("neogit")

neogit.setup({})

vim.keymap.set({ "n" }, "<Space>gg", neogit.open )
