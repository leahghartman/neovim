local opt = vim.opt -- For conciseness

-- Sets NetRW view to tree view
vim.cmd("let g:netrw_liststyle = 3")

-- Line Numbers
opt.relativenumber = true -- Show relative line numbers
opt.number         = true -- Shows absolute line number on cursor line

-- Tabbing and Indentation
opt.tabstop    = 4    -- Four spaces for tabs
opt.shiftwidth = 4    -- Four spaces for indent width
opt.expandtab  = true -- Expand tab to spaces
opt.autoindent = true -- Copy indent from current line when starting a new one

-- Line Wrapping
opt.wrap        = true
opt.breakindent = true
opt.linebreak   = true

-- Search Settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase  = true  -- If you include mixed-case in your search, assumes you want case-sensitive

-- Appearance
opt.termguicolors = true -- Turn on termguicolors for colorscheme to work
opt.background    = "dark" -- Colorschemes that can be light or dark will be made dark
opt.signcolumn    = "yes" -- Show sign column so that text doesn't shift

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspace on indent, end of line or insert mode start position

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard as default register

-- Split windows
opt.splitright = true -- Split vertical window to the right
opt.splitbelow = true -- Split horizontal window to the bottom

-- Turn off swapfile
opt.swapfile = false

-- Random
opt.conceallevel = 2
opt.colorcolumn  = "80,120"
