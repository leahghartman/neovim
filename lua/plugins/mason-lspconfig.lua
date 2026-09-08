return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "stevearc/conform.nvim",
        "ray-x/lsp_signature.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    },

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lsp_signature = require("lsp_signature")

        -- 1. Unified LspAttach Autocommand (Native v0.11 method for keybinds)
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local bufnr = ev.buf
                local client = vim.lsp.get_client_by_id(ev.data.client_id)

                vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
                if client and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) -- Modern v0.12 API syntax
                end
                lsp_signature.on_attach({}, bufnr)

                local keymap = vim.keymap
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>",
                    { buffer = bufnr, desc = "Show LSP references" })
                keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
                    { buffer = bufnr, desc = "Show LSP definitions" })
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
                    { buffer = bufnr, desc = "Show LSP implementations" })
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
                    { buffer = bufnr, desc = "Show LSP type definitions" })
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                    { buffer = bufnr, desc = "See available code actions" })
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>",
                    { buffer = bufnr, desc = "Show buffer diagnostics" })
                keymap.set("n", "<leader>d", vim.diagnostic.open_float,
                    { buffer = bufnr, desc = "Show line diagnostics" })
                keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", { buffer = bufnr, desc = "Restart LSP" })
            end,
        })

        -- 2. Setup Core Mason (Bypass global execution loop warnings)
        if not package.loaded["mason"].setup_called then
            require("mason").setup()
        end

        -- 3. Declare Tools
        local lsp_servers = {
            "neocmake", -- Fixed Python issue from previous step by switching to native neocmake
            "fortls",
            "lua_ls",
            "texlab",
        }

        local non_lsp_tools = {
            "clang-format",
            "fprettify",
        }

        require("mason-lspconfig").setup({ ensure_installed = lsp_servers })

        local all_tools = vim.list_extend({}, lsp_servers)
        vim.list_extend(all_tools, non_lsp_tools)
        require("mason-tool-installer").setup({ ensure_installed = all_tools })

        -- 4. Setup Conform Formatter Shortcut (Safe for Fortran)
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                fortran = { "fprettify" },
                c = { "clang-format" },
                cpp = { "clang-format" },
                python = { "isort", "black" },
                rust = { "rustfmt" },
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({ async = true, lsp_fallback = true })
        end, { desc = "Format buffer" })

        -- 5. NEW NATIVE LSP CONFIG INITIALIZATION (Bypasses require('lspconfig') framework warning)
        for _, server in ipairs(lsp_servers) do
            vim.lsp.config[server] = {
                capabilities = capabilities,
            }
            vim.lsp.enable(server) -- This replaces lspconfig[server].setup()
        end

        -- Extra fallback for manual/custom engines like marksman
        vim.lsp.config.marksman = { capabilities = capabilities }
        vim.lsp.enable("marksman")
    end,
}
