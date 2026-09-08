return {
	"numToStr/Comment.nvim",
	lazy = false, -- CRITICAL: Ensures the plugin loads at startup and completely avoids [Comment.nvim] nil
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Add Fortran explicit token support to the dictionary
		local ft = require("Comment.ft")
		ft.set("fortran", "! %s")

		comment.setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
