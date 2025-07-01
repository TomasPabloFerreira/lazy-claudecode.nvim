return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = {
    settings = {
      expose_as_code_action = "all",
      tsserver_plugins = {},
      -- Si querés apuntar al tsserver de tu proyecto:
      -- tsserver_path = "node_modules/typescript/lib/tsserver.js",
      tsserver_file_preferences = {
        includeInlayParameterNameHints = "all",
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
        includeCompletionsForImportStatements = true,
      },
    },
  },
}

