-- This is my personal Neovim configuration, tailored for both MacOS and Linux.
--
-- It's quite comprehensive, so feel free to extract only the parts or settings
-- that are relevant to your needs.
--
-- I think that a good Neovim setup is highly personal and often the result of
-- gradual refinement, so I don't recommend cloning this repository as-is,
-- unless you know what you're doing.
--
-- Author: Leah Hartman
-- Email:  lghart@umich.edu
-- Github: https://github.com/leahghartman

vim.loader.enable()

require("globals")
require("mappings")
require("plugin_specs")
require("options")
