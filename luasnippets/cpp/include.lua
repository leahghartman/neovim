local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    -- include stdio
    s({trig = "iio", snippetType="autosnippet"},
      { t('#include <stdio>') },
      {condition = line_begin}
    ),
    -- include math
    s({trig = "imm", snippetType="autosnippet"},
      { t('#include <math>') },
      {condition = line_begin}
    ),
    -- include stdlib
    s({trig = "ilib", snippetType="autosnippet"},
      { t('#include <stdlib>') },
      {condition = line_begin}
    ),
    -- include string
    s({trig = "istr", snippetType="autosnippet"},
      { t('#include <string>') },
      {condition = line_begin}
    ),
    -- define M_PI if not defined
    s({trig = "MPI", snippetType="autosnippet"},
      fmt(
        [[
        #ifndef M_PI
        #define M_PI 3.14159265358979323846264338
        #endif
        ]],
        {
        }
      ),
      {condition = line_begin}
    ),
}
