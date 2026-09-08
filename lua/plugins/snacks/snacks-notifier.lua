return {
    "folke/snacks.nvim",
    opts = {
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        styles = {
            notification = {
                -- wo = { wrap = true }
            },
        },
    },
    keys = {
        { "<leader>no",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    },
}
