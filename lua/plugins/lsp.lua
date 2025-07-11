return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" }, -- typescript-tools already handles TS
    })

    local lspconfig = require("lspconfig")
    
    -- Only configure lua_ls since typescript-tools handles TS
    lspconfig.lua_ls.setup({
      capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        {
          general = {
            positionEncodings = { "utf-16" },
          },
        }
      ),
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
  end,
}