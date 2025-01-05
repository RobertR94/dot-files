return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    config = function()
      -- We'll keep the actual null-ls configuration in lspconfig.lua for simplicity.
      -- You could also configure null-ls here if you prefer.
    end,
  },
}
