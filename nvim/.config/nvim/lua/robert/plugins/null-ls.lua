return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.pylint.with({
          args = { "--output-format=json", "--disable=E0401", "$FILENAME" },
        }),
      },
    })

    require("mason-null-ls").setup({
      ensure_installed = { "pylint" },
      automatic_installation = true,
    })
  end,
}
