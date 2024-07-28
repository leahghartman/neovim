# Neovim Configuration

This repository's purpose is to keep track of all of my Neovim configurations, including all of the plugins that I use with Neovim and their corresponding configuration files. Most things like linters, LSPs, and formatters should install automatically via Mason.

## VimTeX

If you're wanting to use this Neovim configuration for LaTeX, then you need to make sure you have the following installed:
- latexmk
- zathura
- pdflatex
- any LaTeX packages you like

It's worth noting that latexmk and zathura can be individually installed on your system, but when it comes to pdflatex and LaTeX packages, I recommend installing the TexLive base using the following, which will automatically install pdflatex:

```
sudo apt-get install texlive-latex-base
```

This package contains packages that are either mandated by the core LaTeX team, or very widely used and strongly recommended in practice.

I would also recommend installing the recommended and extra fonts to avoid running into the errors when trying to use pdflatex on latex files with more fonts.

```
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-fonts-extra
```

Finally, I'd install the following, which just contains a veery large collection of add-on packages. 

```
sudo apt-get install texlive-latex-extra
```

This also reinstalls some of the things we did above, but that's fine. You should now be able to create PDF files from latex sources using pdflatex.

## Working With MacOS

I work on both MacOS and Linux, so my configuration changes slightly between my two devices. Mostly, this is just because Zathura (for use with VimTeX) is just really weird to use on MacOS, so I use Skim instead. So, depending on which device I pushed the config from, you might see one or the other. Just change the 'vimtex_view_method' in the vimtex.lua file under the 'plugins' folder to whichever you want to use for your system.


