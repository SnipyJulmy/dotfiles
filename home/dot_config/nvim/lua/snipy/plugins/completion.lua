return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-git",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-rg",
      "rcarriga/cmp-dap",
      "max397574/cmp-greek",
      "saadparwaiz1/cmp_luasnip",
      "chrisgrieser/cmp-nerdfont",
    },
    -- opts = function(_, opts)
    --   opts.sources = vim.tbl_filter(function(path)
    --     return not vim.tbl_contains({ "path" }, path.name)
    --   end, opts.sources)
    -- end,
    enable = false,
  },
}
