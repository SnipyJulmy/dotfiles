local capabilities = require("snipy.lsp.capabilities")
local on_attach = require("snipy.lsp.on_attach")

vim.o.completeopt = "menuone,noselect,popup"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    on_attach(client, event.buf)
  end,
})

---@type vim.lsp.Config
vim.lsp.config("*", {
  root_markers = { ".git" },
  capabilities = capabilities,
})

---@type vim.lsp.Config
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".git",
    ".luacheckrc",
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "selene.toml",
    "selene.yml",
    "stylua.toml",
  },
  workspace_required = false,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim", "it", "describe", "before_each", "use" },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
      },
      telemetry = {
        enable = false,
      },
      completion = {
        enable = true,
        showParams = true,
      },
    },
  },
}

---@type vim.lsp.Config
vim.lsp.config.vimls = {
  cmd = { "vim-language-server", "--stdio" },
  filetypes = { "vim" },
  root_dir = function(bufnr, callback)
    local candidates = { ".git" }
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local root_dir = vim.fs.dirname(vim.fs.find(candidates, { path = filepath, upward = true })[1])
    callback(root_dir)
  end,
  settings = {
    vimls = {
      initializationOptions = {
        isNeovim = true,
        diagnostic = {
          enable = true,
        },
      },
    },
  },
}

---@type vim.lsp.Config
vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
  workspace_required = false,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*(.sh|.inc|.bash|.command)",
    },
  },
}

---@type vim.lsp.Config
vim.lsp.config.bzl = {
  cmd = { "bzl", "lsp", "serve" },
  filetypes = { "bzl" },
  root_markers = { "MODULE.bazel", "WORKSPACE", "WORKSPACE.bazel" },
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
}

---@type vim.lsp.Config
vim.lsp.config.gh_actions = {
  cmd = { "gh-actions-language-server", "--stdio" },
  filetypes = { "yaml" },
  root_dir = function(bufnr, callback)
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local parent_directory = vim.fs.dirname(filepath)
    if vim.endswith(parent_directory, "/.github/workflows") then
      local workspace_directory = vim.fs.dirname(vim.fs.find(".github", { path = parent_directory, upward = true })[1])
      callback(workspace_directory)
    end
  end,
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  settings = {},
}

---@type vim.lsp.Config
vim.lsp.config.kotlin_lsp = {
  cmd = { "kotlin-ls", "--stdio" },
  filetypes = { "kotlin" },
  capabilities = require("snipy.lsp.capabilities"),
  on_attach = require("snipy.lsp.on_attach"),
  root_markers = {
    "build.gradle",
    "build.gradle.kts",
    "pom.xml",
  },
  workspace_required = false,
  settings = {},
}

vim.lsp.enable({ "lua_ls", "vimls", "bashls", "bzl" })

-- Scala with Metals
local metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  showInferredType = true,
  fallbackScalaVersion = "3.3.5",
  excludedPackages = {
    "akka.actor.typed.javadsl",
    "com.github.swagger.akka.javadsl",
    "akka.stream.javadsl",
    "akka.http.javadsl",
  },
  serverVersion = "latest.release",
}

metals_config.init_options = {
  statusBarProvider = "off",
  icons = "unicode",
}
metals_config.capabilities = capabilities
metals_config.on_attach = function(client, bufnr)
  -- require("metals").setup_dap()
  on_attach(client, bufnr)
  return metals_config
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("metals", { clear = true }),
  pattern = { "scala", "sbt" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
})
