--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- which-key.nvim
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- This is a plugin which helps you remember your Neovim keymaps, by showing available
-- keymaps in a popup as you type.

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
        spec = {
            { "<leader>l", group = "VimTeX" },
        },
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps",
		},
	},
}
