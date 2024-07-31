return {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX

  init = function()

    -- Settings
    vim.g.vimtex_view_method = "zathura" -- change to "zathura" when on Linux

    -- Warnings to ignore
    vim.g.vimtex_quickfix_ignore_filters = {
        'Underfull',
        'Overfull',
        'Empty bibliography',
    }

    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

  end,
}
