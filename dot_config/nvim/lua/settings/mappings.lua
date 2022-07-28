local utils = require("utils")

-- clear some mapping
vim.keymap.set({ "n" }, "J", "", {})

-- telescope
utils.map("n", "<space>ff", [[<cmd>Telescope find_files<CR>]])
utils.map("n", "<space>fF", [[<cmd>Telescope find_files hidden=true<CR>]])
utils.map("n", "<space>fg", [[<cmd>Telescope live_grep<CR>]])
utils.map("n", "<space>fl", [[<cmd> lua require'telescope.builtin'.grep_string({search = vim.fn.expand("<cword>")})<CR>]])
utils.map("n", "<space>fb", [[<cmd>Telescope buffers<CR>]])
utils.map("n", "<space>fh", [[<cmd>Telescope help_tags<CR>]])
utils.map("n", "<space>fs", [[<cmd>Telescope lsp_document_symbols<CR>]])
utils.map("n", "<space>fm", [[<cmd>Telescope harpoon marks<CR>]])

-- lsp
utils.map("n", "<space>mf", [[<cmd>lua vim.lsp.buf.format({async = true})<CR>]])
utils.map("n", "gD", [[<cmd>lua vim.lsp.buf.declaration()<CR>]])
utils.map("n", "gd", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
utils.map("n", "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
utils.map("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
utils.map("n", "gsd", [[<cmd>lua vim.lsp.buf.document_symbol()<CR>]])
utils.map("n", "gsw", [[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]])
utils.map("n", "gk", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
utils.map("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
utils.map("n", "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
utils.map("n", "<leader>ca", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
utils.map("v", "<leader>ca", [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]])

vim.keymap.set({ "n" }, "<leader>clrr", [[<cmd>lua vim.lsp.codelens.refresh()<CR>]])
vim.keymap.set({ "n" }, "<leader>clru", [[<cmd>lua vim.lsp.codelens.run()<CR>]])

utils.map("n", "gpd", [[<cmd>lua require("goto-preview").goto_preview_definition()<CR>]])
utils.map("n", "gpi", [[<cmd>lua require("goto-preview").goto_preview_implementation()<CR>]])
utils.map("n", "gpr", [[<cmd>lua require("goto-preview").goto_preview_references()<CR>]])
utils.map("n", "gP", [[<cmd>lua require("goto-preview").close_all_win()<CR>]])

-- diagnostics
utils.map("n", "]g", [[<cmd>lua vim.diagnostic.goto_next()<CR>]])
utils.map("n", "[g", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]])
utils.map("n", "<C-g>", [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]])

-- git
vim.keymap.set({ "n" }, "[h", [[<cmd>GitGutterPrevHunk<CR>]])
vim.keymap.set({ "n" }, "]h", [[<cmd>GitGutterNextHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>hp", [[<cmd>GitGutterPreviewHunk<CR>]])
vim.keymap.set({ "n" }, "<leader>ht", [[<cmd>GitGutterToggle<CR>]])

vim.keymap.set({ "n" }, "<space>gg", [[<cmd>Git<CR>]])
vim.keymap.set({ "n" }, "<space>gp", [[<cmd>Git push --force-with-lease<CR>]])
vim.keymap.set({ "n" }, "<space>gb", [[<cmd>Git blame<CR>]])

-- formatting
-- utils.map("n", "<Space>F", [[<cmd><CR>]])
vim.keymap.set({ "n" }, "<Space>F", [[<cmd>Neoformat<CR>]])

-- neo-tree
vim.keymap.set({ "n" }, "<C-n>", [[<cmd>Neotree filesystem reveal left toggle<CR>]])
vim.keymap.set({ "n" }, "<leader>b", [[<cmd>Neotree buffers float toggle=true<CR>]])
vim.keymap.set({ "n" }, "<leader>g", [[<cmd>Neotree git_status float toggle=true<CR>]])

-- terminal mappings
utils.map("t", "<ESC>", [[<C-\><C-n>]])
utils.map("t", "<C-w>h", [[<C-\><C-n><C-W>h]])
utils.map("t", "<C-w>j", [[<C-\><C-n><C-W>j]])
utils.map("t", "<C-w>k", [[<C-\><C-n><C-W>k]])
utils.map("t", "<C-w>l", [[<C-\><C-n><C-W>l]])

-- windows movements
vim.keymap.set({ "n" }, "<C-w><C-w>", "<C-w><C-p>", {})

-- hop.nvim
utils.map("n", "<Space>ww", [[<cmd>lua require("hop").hint_words({})<CR>]])
utils.map("n", "<Space>wc", [[<cmd>lua require("hop").hint_char1({})<CR>]])
utils.map("n", "<Space>wl", [[<cmd>lua require("hop").hint_lines({})<CR>]])

-- others
vim.keymap.set({ "n" }, "<space>q", [[<cmd>lua close_buffer()<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>r", [[<cmd> source $HOME/.config/nvim/init.lua<CR>]])
