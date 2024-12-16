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
          "docker_compose_language_service",
          "emmet_ls",
          "cssls",
          "dockerls",
          "gopls",
          "helm_ls",
          "html",
          "jdtls",
          "jsonls",
          "lua_ls",
          "marksman",
          "pyright",
          "rnix",
          "rust_analyzer",
          "texlab",
          "ts_ls",
          "tinymist",
          "vimls",
          "yamlls",
        },
      })
    end,
  },
}
