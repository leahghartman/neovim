-- Lualine is an easy-to-configure Neovim statusline plugin

-- -- Define colors that we want to use
local hslutil = require("solarized-osaka.hsl")
local hsl = hslutil.hslToHex

local colors = {
	red = hsl(1, 71, 52), -- red500
	orange = hsl(18, 80, 44), -- orange500
	yellow = hsl(45, 100, 35), -- yellow500
	green = hsl(68, 100, 30), -- green500
	cyan = hsl(175, 59, 40), -- cyan500
	blue = hsl(205, 69, 49), -- blue500
	violet = hsl(237, 43, 60), -- violet500
	magenta = hsl(331, 64, 52), -- magenta500
	grey = hsl(194, 14, 40), -- base01
	white = hsl(180, 7, 70), -- base3
	black = hsl(192, 100, 5), -- base04
}

-- Something
local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

-- Return the final configuration for Lualine
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				theme = "solarized-osaka",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			extensions = { "nvim-tree", "fugitive", "overseer", "trouble" },
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "branch", color = { bg = colors.grey } },
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "error", "warn" },
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yelllow },
						},
						symbols = {
							error = "󰅚 ",
							warn = "󰀪 ",
						},
						color = { bg = hsl(192, 81, 14), fg = hsl(180, 7, 70) },
						separator = { left = "", right = "" },
					},
				},
				lualine_c = {
					{
						function()
							return "%="
						end,
						separator = "",
						padding = 0,
					},
					{
						require("gitblame").get_current_blame_text,
						cond = require("gitblame").is_blame_text_available,
						color = { fg = colors.grey },
					},
					-- Right spacer
					{
						function()
							return "%="
						end,
						separator = "",
						padding = 0,
					},
				},
				lualine_x = {},
				lualine_y = { search_result, "filetype" },
				lualine_z = { "%l:%c", "%p%%/%L" },
			},
		})
	end,
}
