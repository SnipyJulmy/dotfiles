local opts = { noremap = true, silent = true }

vim.keymap.set({ "n" }, "J", "", {})
vim.keymap.set({ "n" }, "O", "", {})
vim.keymap.set({ "n" }, "D", "", {})
vim.keymap.set({ "n" }, "L", "", {})
vim.keymap.set({ "n" }, "<C-o>", "", {})
vim.keymap.set({ "n" }, "<C-i>", "", {})
vim.keymap.set({ "n" }, "<C-l>", "", {})
vim.keymap.set({ "n" }, "<C-c>", "<ESC>", opts)

vim.keymap.set({ "n" }, "<Space>de", vim.diagnostic.open_float, opts)
vim.keymap.set({ "n" }, "<Space>dq", vim.diagnostic.setloclist, opts)
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, opts)

vim.keymap.set({ "n" }, "<F10>", "<cmd>wqa<CR>", opts)

vim.keymap.set({ "t" }, "<ESC>", [[<C-\><C-n>]], opts)
vim.keymap.set({ "t" }, "<C-w>h", [[<C-\><C-n><C-W>h]], opts)
vim.keymap.set({ "t" }, "<C-w>j", [[<C-\><C-n><C-W>j]], opts)
vim.keymap.set({ "t" }, "<C-w>k", [[<C-\><C-n><C-W>k]], opts)
vim.keymap.set({ "t" }, "<C-w>l", [[<C-\><C-n><C-W>l]], opts)

vim.keymap.set({ "n" }, "<C-w><C-w>", "<C-w><C-p>", opts)
vim.keymap.set({ "n" }, "<C-w><C-p>", function()
  if pcall(require, "window-picker") then
    local window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(window_id, opts)
  end
end, opts)

vim.keymap.set({ "n" }, "<C-M-j>", "<cmd>resize -2<CR>")
vim.keymap.set({ "n" }, "<C-M-k>", "<cmd>resize +2<CR>")
vim.keymap.set({ "n" }, "<C-M-l>", "<cmd>vertical resize -2<CR>")
vim.keymap.set({ "n" }, "<C-M-h>", "<cmd>vertical resize +2<CR>")

vim.keymap.set({ "n" }, "<space>q", [[<cmd>lua close_buffer()<CR>]], opts)

vim.keymap.set({ "n" }, "<leader>dp", "<cmd>%diffput2<CR>", opts)
vim.keymap.set({ "n" }, "<leader>dg", "<cmd>%diffget1<CR>", opts)

vim.keymap.set({ "n" }, "<leader>tt", "<cmd>tabnew<CR>", opts)

-- quickfix list
vim.keymap.set({ "n" }, "<F7>", "<cmd>cnext<CR>", opts)
vim.keymap.set({ "n" }, "<F8>", "<cmd>cprev<CR>", opts)
vim.keymap.set({ "n" }, "<F9>", "<cmd>cclose<CR>", opts)
