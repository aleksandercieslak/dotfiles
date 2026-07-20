return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--header-insertion=never" },
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
    vim.lsp.enable("clangd")
  end,
}
