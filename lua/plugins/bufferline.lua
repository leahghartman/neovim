-- ## bufferline.nvim ##########################################################
-- ## Shamelessly attempts to emulate the aesthetics of GUI text editors/Doom 
-- ## Emacs.
-- #############################################################################
return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			indicator = { style = "underline" },
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
		highlights = {
			indicator_selected = {
				fg = "#268bd3",
				underline = true,
				sp = "#268bd3",
			},
			tab_selected = {
				bold = true,
			},
		},
	},
}
