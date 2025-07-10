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
    window = {
      width = 30,
      position = "left",
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
      },
    },
  },
  config = function()
    require("neo-tree").setup()

    vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
  end,
}
