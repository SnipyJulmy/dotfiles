return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      -- { "nvim-tree/nvim-web-devicons" },
      -- {
      --   "onsails/lspkind-nvim",
      --   opts = {
      --     mode = "symbol",
      --     preset = "default",
      --   },
      -- },
    },
    opts = {
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show_and_insert" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },

        -- ["<C-Space>"] = { "show_and_insert" },
        -- ["<Tab>"] = { "select_next", "fallback" },
        -- ["<S-Tab>"] = { "select_prev", "fallback" },
        -- ["<CR>"] = { "select_and_accept", "fallback" },
        -- ["<C-p>"] = { "show_signature", "hide_signature" },
        -- ["<C-s>"] = {
        --   function(cmp)
        --     cmp.show({
        --       providers = {
        --         { "snippets" },
        --       },
        --     })
        --   end,
        -- },
      },

      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "omni",
          "cmdline",
        },
      },
      snippets = {
        preset = "luasnip",
      },
      signature = {
        enabled = true,
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
