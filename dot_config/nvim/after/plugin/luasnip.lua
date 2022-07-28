local ls = require("luasnip")

local types = require("luasnip.util.types")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local r = ls.restore_node
local rep = require("luasnip.extras").rep

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

-- require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_snipmate").load()

-- stylua: ignore start
ls.add_snippets("all", {
  s("todo", fmt([[-- {} {}]], { c(1, { t("TODO"), t("FIXME") }), i(2) })),
})

ls.add_snippets("lua", {
  s("req", fmt([[local {} = require("{}")]], { i(1, "default"), rep(1) })),
  s("f", fmt([[function() {} end]], { i(1) })),
  s("r", fmt([[require("{}"){}{}]], { i(1), i(2, ".setup()"), i(0) })),
  s("use", {
    t([[use({"]]),
    i(1, "some/plugin"),
    t([["]]),
    i(2),
    t("})"),
    i(0),
  })
})

ls.add_snippets("go", {
  s("log", c(1, {
    fmt([[log.Printf("{}", {}){}]], {r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")), i(0)}),
    fmt([[log.Panicf("{}", {}){}]], {r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")), i(0)}),
    fmt([[log.Fatalf("{}", {}){}]], {r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")), i(0)}),
  }, {restore_cursor = true})),
  s("pr", c(1, {
    fmt([[fmt.Println("{}")]],    {r(1, "msg", i(nil, "msg"))}),
    fmt([[fmt.Printf("{}", {})]], {r(1, "msg", i(nil, "msg")), i(2, "args")}),
    fmt([[fmt.Print("{}")]],      {r(1, "msg", i(nil, "msg"))}),
  }, {restore_cursor = true})),
  s("ier", c(1, {
    fmt([[
    {}, err := {}
    if err != nil {{
            log.Fatalf("{}", {})
    }}
    ]], {
      r(1, "var",  i(nil, "var")),
      r(2, "fErr", i(nil)),
      r(3, "msg",  i(nil, "msg")),
      r(4, "args", i(nil, "args...")),
    }),
    t("Hello")
  }, {restore_cursor = true})),
  s("er", c(1, {
    fmt([[{}, err := {}{}]], {i(1, "var"), i(2), i(0)}),
    fmt([[var {}, err = {}{}]], {i(1, "var"), i(2), i(0)}),
  })),
  s("ie", c(1, {
    fmt([[
      if err != nil {{
              {}
      }}
    ]], {i(1)})
  }))
})

ls.add_snippets("scala", {
  s("main", fmt([[
      def main(args : Array[String]) = {{
        {}
      }}
    ]], { i(1) }
  )),
})

ls.add_snippets("xml", {
  s("logback", fmt([[
  <configuration>
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
      <!-- encoders are assigned the type
          ch.qos.logback.classic.encoder.PatternLayoutEncoder by default -->
      <encoder>
        <pattern>%d{{HH:mm:ss.SSS}} [%thread] %-5level %logger{{36}} - %msg%n</pattern>
      </encoder>
    </appender>
    <root level="{}">
      <appender-ref ref="STDOUT" />
    </root>
  </configuration>
  ]], {
      c(1, {
        t("debug"),
        t("error"),
        t("warn"),
      })
    }
  )),
  s("logback_off", fmt([[
    <!-- Logger OFF for tests -->
    <configuration/>
  ]], {})),
})
-- stylua: ignore end

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_locally_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require("luasnip.extras.select_choice"))
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
