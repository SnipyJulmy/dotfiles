return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "beautysh",
          "black",
          "docker_compose_language_service",
          "emmet_ls",
          "google-java-format",
          "cssls",
          "dockerls",
          "gopls",
          "helm_ls",
          "html",
          "jdtls",
          "java-debug-adapter",
          "java-test",
          "jsonls",
          "lua_ls",
          "luacheck",
          "luaformatter",
          "marksman",
          "prettier",
          "pyright",
          "rnix",
          "stylua",
          "rust_analyzer",
          "texlab",
          "ts_ls",
          "vimls",
          "yamlls",
          "yamllint",
        },
      })
    end,
  },
}
