-- clear some mapping
vim.keymap.set({ "n" }, "J", "", {})

-- telescope
vim.keymap.set({ "n" }, "<space>ff", [[<cmd>Telescope find_files<CR>]])
vim.keymap.set({ "n" }, "<space>fF", [[<cmd>Telescope find_files hidden=true<CR>]])
vim.keymap.set({ "n" }, "<space>fg", [[<cmd>Telescope live_grep<CR>]])
vim.keymap.set({ "n" }, "<space>fl", [[<cmd> lua require'telescope.builtin'.grep_string({search = vim.fn.expand("<cword>")})<CR>]])
vim.keymap.set({ "n" }, "<space>fb", [[<cmd>Telescope buffers<CR>]])
vim.keymap.set({ "n" }, "<space>fh", [[<cmd>Telescope help_tags<CR>]])
vim.keymap.set({ "n" }, "<space>fs", [[<cmd>Telescope lsp_document_symbols<CR>]])
vim.keymap.set({ "n" }, "<space>fm", [[<cmd>Telescope harpoon marks<CR>]])

-- git
vim.keymap.set({ "n" }, "[h", [[<cmd>GitGutterPrevHunk<CR>]])
vim.keymap.set({ "n" }, "]h", [[<cmd>GitGutterNextHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>hp", [[<cmd>GitGutterPreviewHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>ht", [[<cmd>GitGutterToggle<CR>]])
vim.keymap.set({ "n" }, "<space>gg", [[<cmd>Git<CR>]])
vim.keymap.set({ "n" }, "<space>gp", [[<cmd>Git push --force-with-lease<CR>]])
vim.keymap.set({ "n" }, "<space>gb", [[<cmd>Git blame<CR>]])

-- formatting
vim.keymap.set({ "n" }, "<Space>F", [[<cmd>Format<CR>]])

-- neo-tree
vim.keymap.set({ "n" }, "<C-n>", [[<cmd>Neotree filesystem reveal left toggle<CR>]])
vim.keymap.set({ "n" }, "<leader>b", [[<cmd>Neotree buffers float toggle=true<CR>]])
vim.keymap.set({ "n" }, "<leader>g", [[<cmd>Neotree git_status float toggle=true<CR>]])

-- terminal mappings
vim.keymap.set({ "t" }, "<ESC>", [[<C-\><C-n>]])
vim.keymap.set({ "t" }, "<C-w>h", [[<C-\><C-n><C-W>h]])
vim.keymap.set({ "t" }, "<C-w>j", [[<C-\><C-n><C-W>j]])
vim.keymap.set({ "t" }, "<C-w>k", [[<C-\><C-n><C-W>k]])
vim.keymap.set({ "t" }, "<C-w>l", [[<C-\><C-n><C-W>l]])

-- windows movements
vim.keymap.set({ "n" }, "<C-w><C-w>", "<C-w><C-p>")

-- hop.nvim
vim.keymap.set({ "n" }, "<Space>ww", [[<cmd>lua require("hop").hint_words({})<CR>]])
vim.keymap.set({ "n" }, "<Space>wc", [[<cmd>lua require("hop").hint_char1({})<CR>]])
vim.keymap.set({ "n" }, "<Space>wl", [[<cmd>lua require("hop").hint_lines({})<CR>]])

-- others
vim.keymap.set({ "n" }, "<space>q", [[<cmd>lua close_buffer()<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>r", [[<cmd> source $HOME/.config/nvim/init.lua<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>s", [[<cmd> source %<CR>]])
