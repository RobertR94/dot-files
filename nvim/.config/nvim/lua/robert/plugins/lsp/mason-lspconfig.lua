return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "clangd",
            "lua_ls",
            "rust_analyzer",
            "cmake",
            "pyright",
        },
        automatic_installation = true,
        automatic_enable = {
            exclude = { "ruff" },
        },

        handlers = {
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,

            ["clangd"] = function()
                require("lspconfig").clangd.setup({
                    cmd = {
                        "clangd",
                        "--clang-tidy",
                        "--header-insertion=never",
                        "--pch-storage=memory",
                    },
                    settings = {
                        clangd = {
                            arguments = { "-I${workspaceFolder}/**" },
                        },
                    },
                })
            end,

            ["svelte"] = function()
                require("lspconfig").svelte.setup({
                    on_attach = function(client, bufnr)
                        vim.api.nvim_create_autocmd("BufWritePost", {
                            pattern = { "*.js", "*.ts" },
                            callback = function(ctx)
                                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                            end,
                        })
                    end,
                })
            end,

            ["graphql"] = function()
                require("lspconfig").graphql.setup({
                    filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                })
            end,

            ["emmet_ls"] = function()
                require("lspconfig").emmet_ls.setup({
                    filetypes = {
                        "html",
                        "typescriptreact",
                        "javascriptreact",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "svelte",
                    },
                })
            end,

            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            completion = { callSnippet = "Replace" },
                        },
                    },
                })
            end,
        },
    },
}
