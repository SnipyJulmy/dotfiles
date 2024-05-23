-- clear some mapping
vim.keymap.set({ "n" }, "J", "", {})
vim.keymap.set({ "n" }, "O", "", {})

-- diagnostics
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n" }, "<Space>de", vim.diagnostic.open_float, opts)
vim.keymap.set({ "n" }, "<Space>dq", vim.diagnostic.setloclist, opts)
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, opts)

-- telescope
vim.keymap.set({ "n" }, "<space>ff", [[<cmd>Telescope find_files<CR>]])
vim.keymap.set({ "n" }, "<space>fF", [[<cmd>Telescope find_files hidden=true<CR>]])
vim.keymap.set({ "n" }, "<space>fg", [[<cmd>Telescope live_grep<CR>]])
-- vim.keymap.set({ "n" }, "<space>fl", [[<cmd> lua require'telescope.builtin'.grep_string({search = vim.fn.expand("<cword>")})<CR>]])
vim.keymap.set({ "n" }, "<space>fb", [[<cmd>Telescope buffers<CR>]])
vim.keymap.set({ "n" }, "<space>fh", [[<cmd>Telescope help_tags<CR>]])
vim.keymap.set({ "n" }, "<space>fs", [[<cmd>Telescope lsp_document_symbols<CR>]])
vim.keymap.set({ "n" }, "<space>fm", [[<cmd>Telescope harpoon marks<CR>]])
vim.keymap.set({ "n" }, "<space>fa", [[<cmd>Telescope man_pages<CR>]])
vim.keymap.set({ "n" }, "<space>fcc", [[<cmd>Telescope git_commits<CR>]])

-- git
vim.keymap.set({ "n" }, "[h", [[<cmd>GitGutterPrevHunk<CR>]])
vim.keymap.set({ "n" }, "]h", [[<cmd>GitGutterNextHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>gp", [[<cmd>GitGutterPreviewHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>gt", [[<cmd>GitGutterToggle<CR>]])

-- formatting
vim.keymap.set({ "n" }, "<space>F", [[<cmd>Format<CR>]])

-- terminal mappings
vim.keymap.set({ "t" }, "<ESC>", [[<C-\><C-n>]])
vim.keymap.set({ "t" }, "<C-w>h", [[<C-\><C-n><C-W>h]])
vim.keymap.set({ "t" }, "<C-w>j", [[<C-\><C-n><C-W>j]])
vim.keymap.set({ "t" }, "<C-w>k", [[<C-\><C-n><C-W>k]])
vim.keymap.set({ "t" }, "<C-w>l", [[<C-\><C-n><C-W>l]])

-- windows movements
vim.keymap.set({ "n" }, "<C-w><C-w>", "<C-w><C-p>")
vim.keymap.set({ "n" }, "<C-w><C-p>", function()
  local window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(window_id)
end)

-- hop.nvim
vim.keymap.set({ "n" }, "<space>ww", [[<cmd>lua require("hop").hint_words({})<CR>]])
vim.keymap.set({ "n" }, "<space>wc", [[<cmd>lua require("hop").hint_char1({})<CR>]])
vim.keymap.set({ "n" }, "<space>wl", [[<cmd>lua require("hop").hint_lines({})<CR>]])

-- others
vim.keymap.set({ "n" }, "<space>q", [[<cmd>lua close_buffer()<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>r", [[<cmd> source $HOME/.config/nvim/init.lua<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>s", [[<cmd> source %<CR>]])
vim.keymap.set({ "n" }, "E", [[<cmd>Explore<CR>]], {})

-- diffs
vim.keymap.set({ "n" }, "<leader>dp", "<cmd>%diffput2<CR>")
vim.keymap.set({ "n" }, "<leader>dg", "<cmd>%diffget1<CR>")

-- quickfix list
vim.keymap.set({ "n" }, "<Space>no", "<cmd>copen<CR>")
vim.keymap.set({ "n" }, "<Space>nq", "<cmd>cclose<CR>")
vim.keymap.set({ "n" }, "<F9>", "<cmd>cclose<CR>")
vim.keymap.set({ "n" }, "<Space>nn", "<cmd>cnext<CR>")
vim.keymap.set({ "n" }, "<F7>", "<cmd>cnext<CR>")
vim.keymap.set({ "n" }, "<Space>np", "<cmd>cprev<CR>")
vim.keymap.set({ "n" }, "<F8>", "<cmd>cprev<CR>")
vim.keymap.set({ "n" }, "<Space>nf", "<cmd>cfirst<CR>")
vim.keymap.set({ "n" }, "<Space>nl", "<cmd>clast<CR>")
for i = 1, 9, 1 do
  vim.keymap.set({ "n" }, "<Space>n" .. i, "<cmd>:cc" .. i .. "<CR>")
end

-- tabs
vim.keymap.set({ "n" }, "<leader>tt", "<cmd>tabnew<CR>")
