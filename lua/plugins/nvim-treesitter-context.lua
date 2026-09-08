return {
	"nvim-treesitter/nvim-treesitter-context",

	config = function()
		require("treesitter-context").setup({
			max_lines = 2, -- How many lines of context to show
			mode = "topline", -- 'cursor', 'topline', 'auto'
			separator = "─", -- Character for the separator line
		})

        vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "TreesitterContextSeparator", { bg = "NONE" })
	end,
}
