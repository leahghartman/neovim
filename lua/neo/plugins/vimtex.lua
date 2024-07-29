return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX

  init = function()
    vim.g.vimtex_view_method = "zathura" -- change to "zathura" when on Linux
    vim.maplocalleader = " "
  end
}
