--
-- do lsp initialization for the various language server
--

local lspUtil = require("lspconfig").util

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

require("goto-preview").setup({
  width = 120,
  height = 15,
  border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" },
  default_mappings = false,
  debug = false,
  opacity = nil,
  resizing_mappings = false,
  post_open_hook = nil,
  references = {
    telescope = require("telescope.themes").get_dropdown({ hide_preview = false }),
  },
  focus_on_open = true,
  dismiss_on_move = false,
  force_close = true,
  bufhidden = "wipe",
})

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
  local dap = require("dap")
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dap-repl" },
    callback = function()
      require("dap.ext.autocompl").attach()
    end,
    group = lsp_group,
  })
  dap.listeners.after["event_terminated"]["nvim-metals"] = function(session, body)
    vim.notify("Tests have finished!")
    dap.repl.open()
  end
  require("metals").setup_dap()
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = lsp_group,
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
})

-- sumneko lua
local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

require("lspconfig").sumneko_lua.setup({
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  commands = {},
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
})

-- json, html and css
require("lspconfig").jsonls.setup({
  capabilities = capabilities,
})

-- yaml
require("lspconfig").yamlls.setup({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      },
    },
  },
})

-- rust
require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
  -- cmd = { "rustup", "run", "nightly", "rust-analyzer" },
})

-- docker
require("lspconfig").dockerls.setup({
  cmd = { "/usr/local/bin/docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = vim.loop.cwd,
  capabilities = capabilities,
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
  capabilities = capabilities,
  single_file_support = true,
})

-- haskell

require("lspconfig").html.setup({
  capabilities = capabilities,
})

require("lspconfig").cssls.setup({
  capabilities = capabilities,
})

require("lspconfig").tsserver.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = lspUtil.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
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
  capabilities = capabilities,
  filetypes = { "go", "gomod" },
  root_dir = lspUtil.root_pattern("go.mod", ".git"),
})

-- vimls
require("lspconfig").vimls.setup({
  diagnostic = {
    enable = true,
  },
})

-- ansible
require("lspconfig").ansiblels.setup({
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yml", "yaml", "yaml.ansible" },
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint",
      },
      executionEnvironment = {
        enabled = false,
      },
      python = {
        interpreterPath = "python",
      },
    },
  },
  single_file_support = true,
})

-- latex
require("lspconfig").texlab.setup({
  settings = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
  },
})

-- nix
require("lspconfig").rnix.setup({
  cmd = { "rnix-lsp" },
  filetypes = { "nix" },
  init_options = {},
  settings = {},
})
