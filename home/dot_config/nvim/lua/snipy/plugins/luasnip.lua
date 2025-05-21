return {
  {
    "L3MON4D3/LuaSnip",
    cond = true,
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      local ls = require("luasnip")
      local types = require("luasnip.util.types")

      ls.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = false,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { "←", "error" } },
            },
          },
        },
      })

      vim.keymap.set({ "i" }, "<C-k>", function()
        if ls.expand_or_locally_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.locally_jumpable(-1) then
          ls.jump(-1)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end)

      vim.keymap.set("i", "<C-u>", require("luasnip.extras.select_choice"))
    end,
  },
}
