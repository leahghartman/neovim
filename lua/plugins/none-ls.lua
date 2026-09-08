return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",

	config = function()
		local null_ls = require("null-ls")

		-- Configure notify
		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}" },
				}),
				null_ls.builtins.formatting.fprettify,
			},
		})
		vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format" })
	end,
}

