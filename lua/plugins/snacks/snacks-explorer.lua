return {
    "folke/snacks.nvim",
    opts = {
        explorer = { enabled = true },
    },
    keys = {
        { "<leader>ee", function() Snacks.explorer() end, desc = "File Explorer" },
    },
}
