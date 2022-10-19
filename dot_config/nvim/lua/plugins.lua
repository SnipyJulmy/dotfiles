return require("packer").startup(function()
  -- automanage packaer
  use("wbthomason/packer.nvim")

  -- apparence, colors
  use({ "kyazdani42/nvim-web-devicons" })
  use({
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      })
    end,
  })

  -- colorscheme
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "morhetz/gruvbox" })

  -- neovim lua development
  use({
    "rafcamlet/nvim-luapad",
    config = function()
      require("luapad").setup()
    end,
  })
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("notify").setup()
    end,
  })

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
  })

  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-dap.nvim" })

  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- update all installed parsers as well when updating the plugin
  use({ "nvim-treesitter/playground" })
  use({ "p00f/nvim-ts-rainbow" })

  -- neo-tree
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        config = function()
          require("window-picker").setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              bo = {
                filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
                buftype = { "terminal" },
              },
            },
            other_win_hl_color = "#f4293f",
          })
        end,
      },
    },
  })

  -- language support
  use({ "solarnz/thrift.vim" })

  -- utils
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-obsession" })
  use({ "godlygeek/tabular" })
  use({ "ellisonleao/glow.nvim" })
  use({ "benmills/vimux" })
  use({ "nathom/filetype.nvim" })
  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })

  use({
    "ThePrimeagen/harpoon",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("harpoon").setup({
        save_on_toggle = false,
        save_on_changes = true,
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
        },
      })
    end,
  })
  use({ "folke/which-key.nvim" })

  -- comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        opleader = {
          line = "gc",
          block = "gb",
        },
        extra = {
          above = "gcO",
          below = "gco",
          eol = "gcA",
        },
      })
    end,
  })

  use({
    "s1n7ax/nvim-comment-frame",
    requires = "nvim-treesitter",
    config = function()
      require("nvim-comment-frame").setup()
    end,
  })

  -- motion
  use({
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    config = function()
      require("hop").setup({
        keys = "fdsajklghuiorewqptzmnbvcxy",
      })
    end,
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = false },
  })

  -- snippet
  use({ "L3MON4D3/LuaSnip" })

  -- formatting
  -- use({ "mhartington/formatter.nvim" })
  use({
    "$HOME/projects/oss/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          lua = { require("formatter.filetypes.lua").stylua },
          go = { require("formatter.filetypes.go").goimports },
          bzl = { require("formatter.filetypes.bzl").buildifier },
          scala = { require("formatter.filetypes.scala").scalafmt },
        },
      })
    end,
  })

  -- lsp + completion and dap
  use({ "neovim/nvim-lspconfig" })
  use({ "mfussenegger/nvim-dap" })
  use({ "onsails/lspkind-nvim" })
  use({ "simrat39/symbols-outline.nvim" })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-git",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "lukas-reineke/cmp-rg",
      "rcarriga/cmp-dap",
      "max397574/cmp-greek",
      "saadparwaiz1/cmp_luasnip",
    },
  })

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" },
        map_cr = true,
        map_complete = true,
      })
    end,
  })
  use({
    "rmagatti/goto-preview",
    config = function()
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
    end,
  })
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  })

  use({
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
  })

  use({
    "theHamsta/nvim-dap-virtual-text",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  })

  use({
    "ericpubu/lsp_codelens_extensions.nvim",
    requires = { { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
    config = function()
      require("codelens_extensions").setup()
    end,
  })

  use({
    "leoluz/nvim-dap-go",
    requires = "mfussenegger/nvim-dap",
    config = function()
      require("dap-go").setup()
    end,
  })

  use({
    "mfussenegger/nvim-dap-python",
    requires = "mfussenegger/nvim-dap",
    config = function()
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
    end,
  })

  -- scala
  -- coc-metals is slow as ****
  use({
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  })

  -- syntax
  use({ "Glench/Vim-Jinja2-Syntax" })
  use({ "jvirtanen/vim-hocon" })

  -- git
  use({ "airblade/vim-gitgutter" })
  use({ "tpope/vim-fugitive" })

  -- quickfix
  use({ "itchyny/vim-qfedit" })

  -- other
  use({ "dstein64/vim-startuptime" })
  use({
    "phaazon/mind.nvim",
    branch = "v2.2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mind").setup()
    end,
  })
end)
