local ls = require("luasnip")

local types = require("luasnip.util.types")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.s
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local r = ls.restore_node
local sn = ls.snippet_node
local f = ls.function_node
local postfix = ls.postfix
local rep = require("luasnip.extras").rep

-- clean all snippets so we don't have duplicates when reloading the file
ls.cleanup()

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

ls.add_snippets("lua", {
  s("todo", fmt([[-- {} {}]], { c(1, { t("TODO"), t("FIXME") }), i(2) })),
  s("req", fmt([[local {} = require("{}")]], { i(1, "default"), rep(1) })),
  s("f", fmt([[function() {} end]], { i(1) })),
  s("setup", fmt([[require("{}"){}{}]], { i(1), i(2, ".setup({})"), i(0) })),
  s("use", {
    t([[use({"]]),
    i(1, "some/plugin"),
    t([["]]),
    i(2),
    t("})"),
    i(0),
  }),
  s(
    "key",
    fmt([[vim.keymap.set({{ {} }}, "{}", {})]], {
      c(1, {
        t([["n"]]),
        t([["i"]]),
        t([["v"]]),
        sn(nil, { i(1, [["n","i"]]) }),
      }, { restore_cursor = false }),
      c(2, {
        sn(nil, { t("<Space>"), r(1, "lhs") }),
        sn(nil, { t("<leader>"), r(1, "lhs") }),
        sn(nil, { t(""), r(1, "lhs") }),
      }),
      c(3, {
        sn(nil, { t([["<cmd>]]), r(1, "rhs"), t([[<CR>"]]) }),
        sn(nil, { t("function() "), r(1, "rhs"), t("end") }),
        sn(nil, { r(1, "rhs") }),
      }),
    })
  ),
})

local function go_log(index)
  return c(index, {
    fmt([[log.Printf("{}", {})]], { r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")) }),
    fmt([[log.Panicf("{}", {})]], { r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")) }),
    fmt([[log.Fatalf("{}", {})]], { r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")) }),
    -- fmt([[log.Println("{}")]], { r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")) }),
    -- fmt([[log.Print("{}")]], { r(1, "msg", i(nil, "msg")), r(2, "args", i(nil, "args...")) }),
  }, { restore_cursor = true })
end

-- stylua: ignore start
ls.add_snippets("go", {
  s("main", fmt(
    [[
    func main() {{
      {}
    }}
    ]], { i(0) }
  )),
  s("log", go_log(1)),
  s("pr",
    c(1, {
      fmt([[fmt.Println("{}")]], { r(1, "msg", i(nil, "msg")) }),
      fmt([[fmt.Printf("{}", {})]], { r(1, "msg", i(nil, "msg")), i(2, "args") }),
      fmt([[fmt.Print("{}")]], { r(1, "msg", i(nil, "msg")) }),
    }, { restore_cursor = true })
  ),
  s("ier",
    c(1, { fmt([[
      {}, err := {}
      if err != nil {{
              log.Fatalf("{}", {})
      }}]],
      {
        r(1, "var", i(nil, "var")),
        r(2, "fErr", i(nil)),
        r(3, "msg", i(nil, "msg")),
        r(4, "args", i(nil, "args...")),
      }),
      fmt([[
        err := {}
        if err != nil {{
                log.Fatalf("{}", {}")
        }}]],
        {
          r(1, "fErr", i(nil)),
          r(2, "msg", i(nil)),
          r(3, "args", i(nil)),
        }
      ),
    }, { restore_cursor = true })
  ),
})

ls.add_snippets("xml", {
  s(
    "logback",
    fmt(
      [[
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
  ]],
      {
        c(1, {
          t("debug"),
          t("error"),
          t("warn"),
        }),
      }
    )
  ),
  s(
    "logback_off",
    fmt(
      [[
    <!-- Logger OFF for tests -->
    <configuration/>
  ]],
      {}
    )
  ),
})
-- stylua: ignore end

ls.add_snippets("markdown", {
  s(
    { trig = "det([0-9]+)", regTrig = true },
    f(function(_, snip)
      return "[DET-" .. snip.captures[1] .. "](https://imtf.atlassian.net/browse/DET-" .. snip.captures[1] .. ")"
    end, {})
  ),
})

ls.add_snippets("markdown", {})

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
