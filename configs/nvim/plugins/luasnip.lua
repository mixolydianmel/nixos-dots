-- Locals for ease of use
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.config.setup({ enable_autosnippets = true })

ls.add_snippets("tex", {
  s({ trig = "temp" }, {
    t({ "\\documentclass{article}" }),
    t({ "", "\\title{" }), i(1), t("}"),
    t({ "", "\\author{" }), i(2), t("}"),
    t({ "", "\\date{" }), i(3), t("}"),
    t({ "", "\\begin{document}" }),
    t({ "", "\t\\maketitle" }),
    t({ "", "\t" }), i(0),
    t({ "", "\\end{document}" }),
  }),
  -- Algo-specific
  s({ trig = "atemp" }, {
    t({ "\\documentclass{article}" }),
    t({ "", "\\usepackage{clrspseudo}" }),
    t({ "", "\\usepackage{amsmath}" }),
    t({ "", "\\title{" }), i(1), t("}"),
    t({ "", "\\author{" }), i(2), t("}"),
    t({ "", "\\date{" }), i(3), t("}"),
    t({ "", "\\begin{document}" }),
    t({ "", "\t\\maketitle" }),
    t({ "", "\t" }), i(0),
    t({ "", "\\end{document}" }),
  }),
  s({ trig = "cb", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\begin{codebox}" }),
    t({ "", "\t" }), i(1),
    t({ "", "\\end{codebox}" }), i(0)
  }),
  s({ trig = "pr", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\proc{" }), i(1), t({ "}" }), i(0)
  }),
  s({ trig = "pn", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\begin{codebox}" }),
    t({ "", "\t\\Procname{$\\proc{" }), i(1), t({ "}(" }), i(2, "n"), t({ ")$}" }),
    t({ "", "\t" }), i(3),
    t({ "", "\\end{codebox}" }), i(0)
  }),
  s({ trig = "ll", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li " }), i(0),
  }),
  s({ trig = "mk", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "$ " }), i(1), t({ " $" }), i(0)
  }),
  s({ trig = "dm", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\[" }),
    t({ "", "\t" }), i(1),
    t({ "", "\\]" }), i(0)
  }),
  s({ trig = "ift", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li \\If $ " }), i(1), t({ " $" }),
    t({ "", "\\Then" }),
    t({ "", "\t" }), i(2),
    t({ "", "\\End" }), i(0)
  }),
  s({ trig = "ifel", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li \\If $ " }), i(1), t({ " $" }),
    t({ "", "\\Then" }),
    t({ "", "\t" }), i(2),
    t({ "", "\\li \\Else" }),
    t({ "", "\t" }), i(3),
    t({ "", "\\End" }), i(0)
  }),
  s({ trig = "ls", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "", "\\li \\Else" }),
    t({ "", "\t" }), i(0)
  }),
  s({ trig = "idt", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\id{ " }), i(1), t({ " } " }), i(0)
  }),
  s({ trig = "idg", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\id{ " }), i(1), t({ " } \\gets " }), i(0),
  }),
  s({ trig = "fordo", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li \\For $ " }), i(1, "i"), t({ " \\gets " }), i(2, "1 \\To n"), t({ " $" }),
    t({ "", "\\Do" }),
    t({ "", "\t" }), i(3),
    t({ "", "\\End" }), i(0)
  }),
  s({ trig = "rett", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li \\Return " }), i(0),
  }),
  s({ trig = "retid", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\li \\Return $ \\id{ " }), i(1), t({ " } $" }), i(0)
  }),
  s({ trig = "ctr", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\const { True }" }), i(0)
  }),
  s({ trig = "cfl", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\const { False }" }), i(0)
  }),
  s({ trig = "cnl", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\const { Nil }" }), i(0)
  }),
  s({ trig = "cns", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\const { " }), i(1), t({ " }" }), i(0)
  }),
})
ls.filetype_extend("plaintex", { "tex" })

ls.add_snippets("norg", {
  s({ trig = "mk", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "$| " }), i(1), t({ " |$" }), i(0)
  }),
  s({ trig = "TH", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "\\Theta" }), i(0)
  })
})

ls.add_snippets("typst", {
  s({ trig = "mk", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "$" }), i(1), t({ "$" }), i(0)
  }),
  s({ trig = "dm", wordTrig = true, snippetType = "autosnippet" }, {
    t({ "$ " }), i(1), t({ " $" }), i(0)
  }),
})

require('luasnip.loaders.from_vscode').lazy_load()
