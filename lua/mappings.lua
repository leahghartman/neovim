local keymap = vim.keymap -- For conciseness
local opts = { noremap = true, silent = true }

vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
        local win = vim.api.nvim_get_current_win()
        local height = vim.api.nvim_win_get_height(win)
        if height < 3 then
            return
        end
        vim.wo.winbar = string.rep("─", vim.api.nvim_win_get_width(win))
    end,
})

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- General Keymaps
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- Decrement

-- Control splits
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Shift focus down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Shift focus up" })
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase split height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease split height" })

-- Add a terminal split
keymap.set("n", "<leader>vt", [[<cmd>vsplit | term<cr>A]], { desc = "Open terminal in vertical split" })
keymap.set("n", "<leader>ht", [[<cmd>split | term<cr>A]], { desc = "Open terminal in horizontal split" })
keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Use jk to enter in terminal normal mode" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- Close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) -- Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) -- Go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) -- Move current buffer to new tab

-- Other keymaps
keymap.set("n", "<leader>y", "<cmd>%yank<cr>", { desc = "Yank entire buffer" })
