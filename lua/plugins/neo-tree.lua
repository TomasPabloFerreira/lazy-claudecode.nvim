return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    -- tus opciones personalizadas si querés
  },
  config = function()
    require("neo-tree").setup()

    vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
  end,
}
