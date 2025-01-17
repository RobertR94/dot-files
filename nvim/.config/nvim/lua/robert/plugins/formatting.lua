return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        cpp = {
          exe = "clang-format",
          args = {
            "-style={BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 120, BinPackParameters: true, BreakBeforeBraces: Allman}",
          },
        },
        c = {
          exe = "clang-format",
          args = {
            "-style={BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 120, BinPackParameters: true, BreakBeforeBraces: Allman}",
          },
        },
        h = {
          exe = "clang-format",
          args = {
            "-style={BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 120, BinPackParameters: true, BreakBeforeBraces: Allman}",
          },
        },
        hxx = {
          exe = "clang-format",
          args = {
            "-style={BasedOnStyle: llvm, IndentWidth: 4, ColumnLimit: 120, BinPackParameters: true, BreakBeforeBraces: Allman}",
          },
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
