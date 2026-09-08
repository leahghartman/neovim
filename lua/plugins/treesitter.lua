--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- nvim-treesitter
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- Provides a simple and easy way to use the interface for tree-sitter in Neovim
-- as well as to provide some basic functionality such as highlighting based on it.

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		-- Native replacement for ensure_installed on the main branch
		local parsers = {
			"cpp",
			"cuda",
			"python",
			"bash",
			"lua",
			"vim",
			"vimdoc",
			"gitignore",
			"fortran",
			"regex",
			"html",
			"yaml",
			"markdown_inline",
			"markdown",
		}

		-- Silently install missing language parsers sequentially in the background
		local install_missing = function()
			local installed = require("nvim-treesitter.info").get_installed_parsers()
			for _, lang in ipairs(parsers) do
				if not installed[lang] then
					vim.cmd("TSInstall " .. lang)
				end
			end
		end

		-- Run the installer without blocking your file explorer startup sequence
		pcall(install_missing)

		-- auto-start highlights & indentation for everything except LaTeX
		vim.api.nvim_create_autocmd("FileType", {
			desc = "User: enable treesitter highlighting",
			callback = function(ctx)
				-- Stop Tree-sitter completely on all variations of LaTeX files
				if ctx.match == "tex" or ctx.match == "latex" or ctx.match == "plaintex" then
					return
				end

				-- Start native Tree-sitter highlighter
				local has_started = pcall(vim.treesitter.start)

				-- Setup native fallback indentation strings
				if has_started then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}

