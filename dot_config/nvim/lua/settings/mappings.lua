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

-- lsp
vim.keymap.set({ "n" }, "<space>mf", [[<cmd>lua vim.lsp.buf.format({async = true})<CR>]])
vim.keymap.set({ "n" }, "gD", [[<cmd>lua vim.lsp.buf.declaration()<CR>]])
vim.keymap.set({ "n" }, "gd", [[<cmd>lua vim.lsp.buf.definition()<CR>]])
vim.keymap.set({ "n" }, "gi", [[<cmd>lua vim.lsp.buf.implementation()<CR>]])
vim.keymap.set({ "n" }, "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]])
vim.keymap.set({ "n" }, "gsd", [[<cmd>lua vim.lsp.buf.document_symbol()<CR>]])
vim.keymap.set({ "n" }, "gsw", [[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]])
vim.keymap.set({ "n" }, "gk", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
vim.keymap.set({ "n" }, "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]])
vim.keymap.set({ "n" }, "<leader>rn", [[<cmd>lua vim.lsp.buf.rename()<CR>]])
vim.keymap.set({ "n" }, "<leader>ca", [[<cmd>lua vim.lsp.buf.code_action()<CR>]])
vim.keymap.set("v", "<leader>ca", [[<cmd>lua vim.lsp.buf.range_code_action()<CR>]])

vim.keymap.set({ "n" }, "<leader>clrr", [[<cmd>lua vim.lsp.codelens.refresh()<CR>]])
vim.keymap.set({ "n" }, "<leader>clru", [[<cmd>lua vim.lsp.codelens.run()<CR>]])

vim.keymap.set({ "n" }, "gpd", [[<cmd>lua require("goto-preview").goto_preview_definition()<CR>]])
vim.keymap.set({ "n" }, "gpi", [[<cmd>lua require("goto-preview").goto_preview_implementation()<CR>]])
vim.keymap.set({ "n" }, "gpr", [[<cmd>lua require("goto-preview").goto_preview_references()<CR>]])
vim.keymap.set({ "n" }, "gP", [[<cmd>lua require("goto-preview").close_all_win()<CR>]])

-- diagnostics
vim.keymap.set({ "n" }, "]g", [[<cmd>lua vim.diagnostic.goto_next()<CR>]])
vim.keymap.set({ "n" }, "[g", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]])
vim.keymap.set({ "n" }, "<C-g>", [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]])

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
-- vim.keymap.set({"n"}, "<Space>F", [[<cmd><CR>]])
-- vim.keymap.set({ "n" }, "<Space>F", [[<cmd>Neoformat<CR>]])

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
vim.keymap.set({ "n" }, "<C-w><C-w>", "<C-w><C-p>", {})

-- hop.nvim
vim.keymap.set({ "n" }, "<Space>ww", [[<cmd>lua require("hop").hint_words({})<CR>]])
vim.keymap.set({ "n" }, "<Space>wc", [[<cmd>lua require("hop").hint_char1({})<CR>]])
vim.keymap.set({ "n" }, "<Space>wl", [[<cmd>lua require("hop").hint_lines({})<CR>]])

-- others
vim.keymap.set({ "n" }, "<space>q", [[<cmd>lua close_buffer()<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>r", [[<cmd> source $HOME/.config/nvim/init.lua<CR>]])
vim.keymap.set({ "n" }, "<leader><leader>s", [[<cmd> source %<CR>]])
