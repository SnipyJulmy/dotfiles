--
-- do lsp initialization for the various language server
--

local lspUtil = require("lspconfig").util
local lsp = require("snipy.lsp")

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
  fallbackScalaVersion = "2.13.15",
  serverVersion = "latest.release",
}

metals_config.tvp = {
  panel_width = 40,
  panel_alignment = "left",
  toggle_node_mapping = "<CR>",
  node_command_mapping = "r",
  collapsed_sign = ">",
  expanded_sign = "v",
  icons = {
    enabled = true,
  },
}

metals_config.handlers["textDocument/publishDiagnostics"] = lsp.diagnostic_settings

metals_config.capabilities = lsp.capabilities

metals_config.on_attach = function(client, bufnr)
  lsp.on_attach(client, bufnr)
  local dap = require("dap")
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "dap-repl" },
    callback = function()
      require("dap.ext.autocompl").attach()
    end,
    group = lsp.group,
  })
  dap.listeners.after["event_terminated"]["nvim-metals"] = function(_, _)
    require("notify")("Tests have finished!")
    dap.repl.open()
  end

  -- metals specific mappings
  vim.keymap.set({ "v" }, "K", require("metals").type_of_range)

  require("metals").setup_dap()
end

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = lsp.group,
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
})

-- lsp setup and install
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "rnix",
    "yamlls",
    "jsonls",
    "dockerls",
    "pyright",
    "gopls",
    "ts_ls",
    "vimls",
    "texlab",
    "html",
    "cssls",
    "jdtls",
    "bashls",
    "taplo",
  },
})

-- lua
require("lspconfig").lua_ls.setup({
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
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- json, html and css
require("lspconfig").jsonls.setup({
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- yaml
require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
    redhat = {
      telemetry = {
        enabled = false,
      },
    },
  },
  single_file_support = true,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

require("lspconfig").rust_analyzer.setup({
  capabilities = lsp.capabilities,
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
    vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
  end,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

require("lspconfig").dockerls.setup({
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = vim.loop.cwd,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

require("lspconfig").pyright.setup({
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
      },
    },
  },
  single_file_support = true,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

require("lspconfig").html.setup({
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  single_file_support = true,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

require("lspconfig").cssls.setup({
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

require("lspconfig").ts_ls.setup({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = lspUtil.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
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
  root_dir = lspUtil.root_pattern("go.mod", "go.work", ".git"),
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- vimls
require("lspconfig").vimls.setup({
  diagnostic = {
    enable = true,
  },
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- latex
require("lspconfig").texlab.setup({
  settings = {
    auxDirectory = ".",
    bibtexFormatter = "texlab",
  },
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- nix
require("lspconfig").rnix.setup({
  cmd = { "rnix-lsp" },
  filetypes = { "nix" },
  init_options = {},
  settings = {},
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- Markdownlsp
-- require("lspconfig").marksman.setup({
--   cmd = { "marksman", "server" },
--   filetypes = { "markdown" },
--   root_dir = lspUtil.root_pattern(".git"),
--   single_file_support = true,
--   capabilities = lsp.capabilities,
--   on_attach = lsp.on_attach,
-- })

-- Emmet
require("lspconfig").emmet_ls.setup({
  single_file_support = true,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- Bash
require("lspconfig").bashls.setup({
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)",
    },
  },
  single_file_support = true,
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

-- Gradle
-- require("lspconfig").gradle_ls.setup({
--   cmd = { "gradle-language-server" },
--   filetypes = { "groovy", "kotlin" },
--   init_options = {
--     settings = {
--       gradleWrapperEnabled = true,
--     },
--   },
--   root_dir = lspUtil.root_pattern("settings.gradles", "settings.gradle.kts"),
--   capabilities = lsp.capabilities,
--   on_attach = lsp.on_attach,
-- })

-- Cucumber
-- require("lspconfig").cucumber_language_server.setup({
-- cmd = { "cucumber-language-server", "--stdio" },
-- filetypes = { "cucumber" },
-- root_dir = lspUtil.find_git_ancestor,
-- capabilities = lsp.capabilities,
-- on_attach = lsp.on_attach,
-- })
