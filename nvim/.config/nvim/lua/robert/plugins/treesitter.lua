return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        {
            "MeanderingProgrammer/treesitter-modules.nvim",
            dependencies = { "nvim-treesitter/nvim-treesitter" },
            opts = {
                ensure_installed = {
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "dockerfile",
                    "gitignore",
                    "graphql",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "python",
                    "query",
                    "rust",
                    "svelte",
                    "tsx",
                    "typescript",
                    "vimdoc",
                    "yaml",
                    "zig",
                },
                highlight = {
                    enable = true,
                    disable = { "markdown", "markdown_inline" },
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
            },
        },
    },
    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        require("nvim-treesitter").install({
            "bash",
            "c",
            "cpp",
            "css",
            "dockerfile",
            "gitignore",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "python",
            "query",
            "rust",
            "svelte",
            "tsx",
            "typescript",
            "vimdoc",
            "yaml",
            "zig",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function(args)
                pcall(vim.treesitter.stop, args.buf)
                vim.bo[args.buf].syntax = "markdown"
                vim.cmd("syntax on")
                vim.wo.conceallevel = 0
            end,
        })
    end,
}
