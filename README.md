# Neovim Configuration

This repository's purpose is to keep track of all of my Neovim configurations, including all of the plugins that I use with Neovim and their corresponding configuration files. Most things like linters, LSPs, and formatters should install automatically via Mason.

## VimTeX

If you're wanting to use this Neovim configuration for LaTeX, then you need to make sure you have the following installed:
- latexmk
- zathura
- pdflatex
- any LaTeX packages you like

It's worth noting that latexmk and Zathura can be individually installed on your system, but when it comes to pdflatex and LaTeX packages, I recommend installing the TexLive base using the following, which will automatically install pdflatex:

```
sudo apt-get install texlive-latex-base
```

This package contains packages that are either mandated by the core LaTeX team, or very widely used and strongly recommended in practice.

I would also recommend installing the recommended and extra fonts to avoid running into errors when trying to use pdflatex on LaTeX files with more fonts.

```
sudo apt-get install texlive-fonts-recommended
sudo apt-get install texlive-fonts-extra
```

Finally, I'd install the following, which just contains a very large collection of add-on packages. 

```
sudo apt-get install texlive-latex-extra
```

This also reinstalls some of the things we did above, but that's fine. You should now be able to create PDF files from LaTeX sources using pdflatex.

## Working With MacOS

I work on both MacOS and Linux, and my config might occasionally reflect that, but I've attempted to add comments wherever that may have occurred. For VimTeX, I was using Skim on MacOS as Zathura had previously presented some issues. However, I'm happy to say those have been fixed, so any differences between the configs for the two systems are pretty minute. 

If you're working with MacOS and want to use Zathura as your PDF viewer for VimTeX, either run ```:help vimtex-faq-zathura-macos``` or visit [this GitHub issue](https://github.com/zegervdv/homebrew-zathura/issues/99), which poses the solution I ended up implementing.
