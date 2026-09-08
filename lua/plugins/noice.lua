return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	config = function()
        require("noice").setup(opts)

		vim.api.nvim_set_hl(0, "NotifyERRORBody", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#ca1243", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyWARNBody", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#fe8019", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyINFOBody", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#268bd3", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#ca1243", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#fe8019", bg = "NONE" })
		vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#268bd3", bg = "NONE" })
	end,
}
