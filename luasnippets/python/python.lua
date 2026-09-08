local utils = require('utils')
local get_visual = utils.get_visual

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- Shebang for scripts
    s({trig = "!!", snippetType="autosnippet"},
      {t("#!/usr/bin/env python")},
      {condition = line_begin}
    ),

    -- PRINT STATEMENT
    s({trig="pp", snippetType="autosnippet"},
      fmta(
        [[print(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),

    -- Print to stderr and exit
    s({trig="fpe", snippetType="autosnippet"},
      fmt(
        [[
          print({}, file=sys.stderr)
        ]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),

    -- MAIN FUNCTION
    s({trig="MM", snippetType="autosnippet"},
      fmta(
        [[
      if __name__ == "__main__":
          <>
      ]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),

    -- Class
    s({trig="cll", snippetType="autosnippet"},
      fmta(
        [[
        class <>:
            <>
        ]],
        {
          i(1),
          i(0),
        }
      ),
      {condition = line_begin}
    ),

    -- TIME, i.e. snippet for timing code execution
    s({trig="time"},
      fmta(
        [[
        start = time.time()
        <>
        end = time.time()
      ]],
        {
          d(1, get_visual),
        }
      )
    ),

    -- for in
    s({trig="frr", snippetType = "autosnippet"},
      fmta(
        [[
        for <> in <>:
            <>
      ]],
        {
          i(1),
          i(2),
          i(3)
        }
      ),
      {condition = line_begin}
    ),

    -- IF STATEMENT
    s({trig="iff", snippetType = "autosnippet"},
      fmta(
        [[
        if <>:
            <>
      ]],
        {
          i(1),
          d(2, get_visual),
        }
      ),
      {condition = line_begin}
    ),

    -- for line in file
    s({trig="flif", snippetType = "autosnippet"},
      fmta(
        [[
        for line in file:
            <>
        ]],
        {
          i(1),
        }
      ),
      {condition = line_begin}
    ),

    -- RETURN STATEMENT
    s({trig = ";r", snippetType = "autosnippet"},
      { t("return") },
      { condition = line_begin }
    ),

    -- assert statement
    s({trig=";a", snippetType = "autosnippet"},
      {t("assert ")},
      {condition = line_begin}
    ),

    -- Square brackets
    s({trig = "gds", snippetType="autosnippet", priority=1000},
      fmta(
        [[
        [
            <>
        ]
        ]],
        { d(1, get_visual) }
      )
    ),

    -- Dictionary key-value pair
    s({trig = ">>", snippetType="autosnippet"},
      fmt(
        [[
        '{}': {},
        ]],
        { i(1), i(2) }
      ),
      {condition = line_begin}
    ),

    -- Format string
    s({trig = 'f"', snippetType="autosnippet", priority=1000},
      fmt(
        [[f"{}"]],
        { d(1, get_visual) }
      )
    ),
}
