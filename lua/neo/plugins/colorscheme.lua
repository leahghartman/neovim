return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- makes sure colorscheme is loaded before all the other start plugins
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true, -- disable setting background
          dim_inactive = false, -- style for floating windows
        },
      })
      -- load the colorscheme here
      vim.cmd("colorscheme carbonfox")
    end,
  },
}
