vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt -- for conciseness

-- Line Numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Tabbing and Indentation
opt.tabstop = 2 -- two spaces for tabs (prettier default)
opt.shiftwidth = 2 -- two spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

-- Line Wrapping
opt.wrap = true -- disable line wrapping

-- Search Settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed-case in your search, assumes you want case-sensitive

-- Appearance
opt.termguicolors = true -- turn on termguicolors for colorscheme to work
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- Split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false

