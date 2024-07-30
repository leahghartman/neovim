return {
  {
    "catppuccin/nvim",
    priority = 1000, -- makes sure colorscheme is loaded before all the other start plugins
    config = function()
      require("catppuccin").setup({
        transparent_background = true, -- disable setting background

        color_overrides = {
				  frappe = {
					  base = "#28282B",
					  mantle = "#28282B",
					  crust = "#28282B",
				  },

        integrations = {
          nvimtree = true,
          treesitter = true,
          mason = true,
          alpha = true,
        },
			},
      })
      -- load the colorscheme here
      vim.cmd("colorscheme catppuccin-frappe")
    end,
  },
}
