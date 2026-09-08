return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        image = { enabled = true },
    },
    keys = {
        { "<leader>z",  function() Snacks.zen() end,             desc = "Toggle Zen Mode" },
        { "<leader>.",  function() Snacks.scratch() end,         desc = "Toggle Scratch Buffer" },
        { "<leader>S",  function() Snacks.scratch.select() end,  desc = "Select Scratch Buffer" },
        { "<leader>bd", function() Snacks.bufdelete() end,       desc = "Delete Buffer" },
        { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        { "]]", function() Snacks.words.jump(vim.v.count1)  end, desc = "Next Reference", mode = { "n", "t" } },
        { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                _G.dd = function(...) Snacks.debug.inspect(...) end
                _G.bt = function() Snacks.debug.backtrace() end

                if vim.fn.has("nvim-0.11") == 1 then
                    vim._print = function(_, ...) dd(...) end
                else
                    vim.print = _G.dd
                end

                Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
