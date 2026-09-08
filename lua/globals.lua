
vim.g.mapleader      = " "  -- Set the leader key to space
vim.g.localleader    = " "  -- Set the local leader key to space
vim.g.maplocalleader = " "  -- 

-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1

-- Do not use builtin matchit.vim and matchparen.vim
vim.g.loaded_matchit    = 1
vim.g.loaded_matchparen = 1

-- Control how to show health check window
vim.g.health = { style = nil }

-- Use English as main language
vim.cmd([[language en_US.UTF-8]])
