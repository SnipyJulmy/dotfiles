--
-- do lsp initialization for the various language server
--

local lspUtil = require("lspconfig").util

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

-- Mappings

local opts = { noremap = true, silent = true }
vim.keymap.set({ "n" }, "<Space>de", vim.diagnostic.open_float, opts)
vim.keymap.set({ "n" }, "<Space>dq", vim.diagnostic.setloclist, opts)
vim.keymap.set({ "n" }, "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set({ "n" }, "[d", vim.diagnostic.goto_prev, opts)

local on_attach = function(lsp_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- lsp
  vim.keymap.set({ "n" }, "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set({ "n" }, "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ "n" }, "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set({ "n" }, "gk", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set({ "n" }, "gsd", vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set({ "n" }, "gsw", vim.lsp.buf.workspace_symbol, bufopts)

  vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, bufopts)

  vim.keymap.set({ "n" }, "<Space>Wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set({ "n" }, "<Space>Wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set({ "n" }, "<Space>Wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  vim.keymap.set({ "n" }, "<Space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set({ "n" }, "<Space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set({ "n" }, "<Space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set({ "n" }, "<space>cf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)

  vim.keymap.set({ "n" }, "<leader>clr", vim.lsp.codelens.refresh, bufopts)
  vim.keymap.set({ "n" }, "<leader>clu", vim.lsp.codelens.run, bufopts)

  vim.keymap.set({ "n" }, "gpd", require("goto-preview").goto_preview_definition, bufopts)
  vim.keymap.set({ "n" }, "gpt", require("goto-preview").goto_preview_type_definition, bufopts)
  vim.keymap.set({ "n" }, "gpi", require("goto-preview").goto_preview_implementation, bufopts)
  vim.keymap.set({ "n" }, "gpr", require("goto-preview").goto_preview_references, bufopts)
  vim.keymap.set({ "n" }, "gpp", require("goto-preview").close_all_win, bufopts)
end

local shared_diagnostic_settings = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
})

capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Metals setup
local metals_config = require("metals").bare_config()

metals_config.init_options.statusBarProvider = "on"

metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
    "akka.stream.javadsl",
    "akka.http.javadsl",
  },
  fallbackScalaVersion = "2.13.8",
  serverVersion = "latest.release",
}

metals_config.tvp = {
  panel_width = 40,
  panel_alignment = "left",
  toggle_node_mapping = "<CR>",
  node_command_mapping = "r",
  collapsed_sign = ">",
  expanded_sign = "v",
}

metals_config.handlers["textDocument/publishDiagnostics"] = shared_diagnostic_settings

metals_config.capabilities = capabilities

metals_config.on_attach = function(client, bufnr)
  on_attach(client, bufnr)
  local dap = require("dap")
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dap-repl" },
    callback = function()
      require("dap.ext.autocompl").attach()
    end,
    group = lsp_group,
  })
  dap.listeners.after["event_terminated"]["nvim-metals"] = function(_, _)
    vim.notify("Tests have finished!")
    dap.repl.open()
  end
  require("metals").setup_dap()
end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   group = lsp_group,
--   pattern = { "scala", "sbt" },
--   callback = function()
--     require("metals").initialize_or_attach(metals_config)
--   end,
-- })

-- lsp setup and install
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "sumneko_lua",
    "rust_analyzer",
    "rnix",
    "yamlls",
    "jsonls",
    "dockerls",
    "pyright",
    "gopls",
    "tsserver",
    "vimls",
    "texlab",
    "html",
    "cssls",
    "kotlin_language_server",
  },
})

-- lua
require("lspconfig").sumneko_lua.setup({
  -- cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "it", "describe", "before_each", "use" },
      },
      workspace = {
        library = {
          vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
          -- vim.fn.expand("~/.luarocks"),
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      completion = {
        enable = true,
        showParams = true,
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- json, html and css
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- yaml
require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- rust
require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- docker
require("lspconfig").dockerls.setup({
  cmd = { "/usr/local/bin/docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = vim.loop.cwd,
  capabilities = capabilities,
  on_attach = on_attach,
})

-- python
require("lspconfig").pyright.setup({
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
  single_file_support = true,
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").html.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

require("lspconfig").tsserver.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = lspUtil.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
})

-- golang
require("lspconfig").gopls.setup({
  cmd = { "gopls", "--remote=auto", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      codelenses = {
        generate = true,
        gc_details = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_depdendency = true,
        vendor = true,
      },
      usePlaceholders = true,
    },
  },
  commands = {},
  filetypes = { "go", "gomod" },
  root_dir = lspUtil.root_pattern("go.mod", ".git"),
  capabilities = capabilities,
  on_attach = on_attach,
})

-- vimls
require("lspconfig").vimls.setup({
  diagnostic = {
    enable = true,
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- latex
require("lspconfig").texlab.setup({
  settings = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- nix
require("lspconfig").rnix.setup({
  cmd = { "rnix-lsp" },
  filetypes = { "nix" },
  init_options = {},
  settings = {},
  capabilities = capabilities,
  on_attach = on_attach,
})

-- kotlin
require("lspconfig").kotlin_language_server.setup({
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  root_dir = lspUtil.root_pattern("settings.gradle", "settings.gradle.kts", "build.xml", "pom.xml", "build.gradle", "build.gradle.kts"),
})
