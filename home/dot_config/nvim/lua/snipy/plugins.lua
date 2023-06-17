return require("packer").startup(function()
  -- automanage packer
  use("wbthomason/packer.nvim")

  use({
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient").enable_profile()
    end,
  })

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
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
      })
    end,
  })
  use({ "folke/tokyonight.nvim" })
  use({ "EdenEast/nightfox.nvim" })
  use({ "rebelot/kanagawa.nvim" })
  use({
    "glepnir/zephyr-nvim",
    requires = { "nvim-treesitter/nvim-treesitter", opt = true },
  })
  use({ "cpea2506/one_monokai.nvim" })

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
      require("notify").setup({
        background_colour = "#000000",
      })
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

  -- file management
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

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        vim_options = {
          show_hidden = true,
        },
      })
      vim.keymap.set({ "n" }, "-", require("oil").open, { desc = "Open parent directory" })
    end,
  })

  -- language support
  use({ "solarnz/thrift.vim" })

  -- utils

  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  })

  use({ "tpope/vim-obsession" })
  use({ "chrisbra/unicode.vim" })
  use({ "godlygeek/tabular" })
  use({ "benmills/vimux" })

  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "light",
      })
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

  use({
    "j-morano/buffer_manager.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      vim.keymap.set({ "n" }, "mb", require("buffer_manager.ui").toggle_quick_menu)
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

  -- lsp + completion and dap
  use({ "neovim/nvim-lspconfig" })
  use({ "onsails/lspkind-nvim" })
  use({
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
  })
  use({
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.gitsigns,
      })
    end,
  })

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
        disable_filetype = { "TelescopePrompt", "text" },
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
    tag = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  })

  use({ "mfussenegger/nvim-dap" })

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

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
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
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

  -- java
  use({ "mfussenegger/nvim-jdtls" })

  -- syntax
  use({ "Glench/Vim-Jinja2-Syntax" })
  use({ "jvirtanen/vim-hocon" })
  use({ "towolf/vim-helm" })

  -- git
  use({
    "ldelossa/gh.nvim",
    requires = {
      "ldelossa/litee.nvim",
    },
    config = function()
      require("litee.lib").setup()
      require("litee.gh").setup()
    end,
  })
  use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
  use({ "lewis6991/gitsigns.nvim" })

  use({
    "rhysd/git-messenger.vim",
    setup = function()
      vim.g.git_messenger_no_default_mappings = true
    end,
  })

  use({ "rhysd/committia.vim" })
  use({ "sindrets/diffview.nvim" })

  -- quickfix
  use({ "itchyny/vim-qfedit" })

  -- other
  use({ "dstein64/vim-startuptime" })
end)
