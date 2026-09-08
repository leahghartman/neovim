return {
	"smjonas/live-command.nvim",

	config = function()
		local live_command = require("live-command")

		-- Configure live-command
		live_command.setup({
			enable_highlighting = true,
			inline_highlighting = true,
		})
	end,
}
