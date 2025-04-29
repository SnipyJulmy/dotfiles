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
          -- vim.api.nvim_get_runtime_file("", true),
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

vim.lsp.enable("lua_ls")
