local keymap = vim.keymap

return {
	"tpope/vim-fugitive",

	config = function()
		-- Set keymaps
		keymap.set("n", "<leader>gW", "<cmd>Gwrite<cr>", { desc = "Git: add file" })
		keymap.set("n", "<leader>gC", "<cmd>Git commit<cr>", { desc = "Git: commit changes" })
		keymap.set("n", "<leader>gU", "<cmd>15 split|term git push<cr>", { desc = "Git: push changes" })
		keymap.set("n", "<leader>gF", ":Git fetch ", { desc = "Git: prune branches" })
	end,
}
