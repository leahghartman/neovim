local utils = require('utils')
local get_visual = utils.get_visual

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- NEW FIGURE, AXES
    s({trig="faxx", snippetType="autosnippet"},
      fmta(
        [[fig, ax = plt.subplots(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),
    -- plt.show()
    s({trig="plss", snippetType="autosnippet"},
      fmt(
        [[plt.show()]],
        { }
      ),
      {condition = line_begin}
    ),
    -- plt.savefig()
    s({trig="plsf", snippetType="autosnippet"},
      fmt(
        [[plt.savefig({})]],
        {i(1)}
      ),
      {condition = line_begin}
    ),
    -- plt.tight_layout()
    s({trig="pltl", snippetType="autosnippet"},
      fmta(
        [[plt.tight_layout()]],
        { }
      ),
      {condition = line_begin}
    ),
    -- AXIS PLOT
    s({trig="axpl", snippetType="autosnippet"},
      fmta(
        [[ax.plot(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),
    -- AXIS SET_XLABEL
    s({trig="axxl", snippetType="autosnippet"},
      fmta(
        [[ax.set_xlabel(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),
    -- AXIS SET_YLABEL
    s({trig="axyl", snippetType="autosnippet"},
      fmta(
        [[ax.set_ylabel(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),
    -- AXIS SET_TITLE
    s({trig="axst", snippetType="autosnippet"},
      fmta(
        [[ax.set_title(<>)]],
        {
          d(1, get_visual),
        }
      ),
      {condition = line_begin}
    ),
    -- TIGHT LAYOUT
    s({trig="ttl", snippetType="autosnippet"},
      {t("plt.tight_layout()")},
      {condition = line_begin}
    ),
}


