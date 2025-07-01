return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "dist", "build" },
      },
    })

    vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Telescope: Find Files" })
    vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: Search in Files" })
    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Telescope: Go to definition" })
  end,
}

