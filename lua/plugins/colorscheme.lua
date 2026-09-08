return {
	"craftzdog/solarized-osaka.nvim",
	lazy = false,
	priority = 1000,
	opts = function()
		return {
			transparent = true,
			styles = { sidebars = "transparent" },

			on_colors = function(colors)
				colors.bg_statusline = "NONE" -- Strips lualine's container bg
				colors.bg_sidebar = "NONE" -- Backup clear rule for sidebars
			end,
		}
	end,
	config = function(_, opts)
		require("solarized-osaka").setup(opts)
		vim.cmd.colorscheme("solarized-osaka")

		-- Native Tabs & Bufferline Backgrounds
		vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "TabLineSel", { bg = "NONE", ctermbg = "NONE" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "SnacksPickerList", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "ErrorMsg", { fg = "#ff5555", bg = "NONE" })

		-- Absolute Lualine & Statusline Transparency (All Modes)
		local lualine_groups = {
			"StatusLine",
			"StatusLineNC",
			"lualine_c_normal",
			"lualine_c_insert",
			"lualine_c_visual",
			"lualine_c_replace",
			"lualine_c_command",
			"lualine_c_inactive",
		}
		for _, group in ipairs(lualine_groups) do
			-- Explicitly disable standard visual inversion filters
			vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE", reverse = false, standout = false })
		end

		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚",
					[vim.diagnostic.severity.WARN] = "󰀪",
					[vim.diagnostic.severity.HINT] = "󰌶",
					[vim.diagnostic.severity.INFO] = "󰋽",
				},
			},
		})
	end,
}
