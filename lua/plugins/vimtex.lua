--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- VimTeX
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- This is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.

return {
	"lervag/vimtex",
	lazy = false,

	init = function()
		-- Settings
		vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_quickfix_mode = 0

		-- Warnings to ignore
		vim.g.vimtex_quickfix_ignore_filters = {
			"Underfull",
			"Overfull",
			"Empty bibliography",
		}

		vim.g.vimtex_compiler_latexmk = {
			build_dir = "build",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
			hooks = {},
			options = {
                "-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
			},
		}
	end,
}
