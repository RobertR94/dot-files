return {
    {
        "mg979/vim-visual-multi",
        branch = "master",
        init = function()
            vim.g.VM_maps = {
                ["Select Cursor Down"] = "<C-j>", -- Use Ctrl + j
                ["Select Cursor Up"] = "<C-k>", -- Use Ctrl + k
                ["Find Under"] = "<C-d>", -- Multi-cursor selection like VS Code
                ["Find Subword Under"] = "<C-d>",
            }
        end,
    },
}
