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

    -- Main telescope keymaps
    local builtin = require("telescope.builtin")
    
    -- Primary shortcuts (most used)
    vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command History" })
    
    -- Alternative shortcuts
    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Search in Files" })
    
    -- Find submenu (leader + f)
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set("n", "<leader>fc", function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config File" })
    
    -- Git submenu (leader + g)  
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Git Commits" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gf", builtin.git_bcommits, { desc = "Git File History" })
    
    -- Search submenu (leader + s)
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help Pages" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
    vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Commands" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "Marks" })
    vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "Jumplist" })
    vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = "Registers" })
    
    -- LSP
    vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "References" })
    vim.keymap.set("n", "gI", builtin.lsp_implementations, { desc = "Implementations" })
    vim.keymap.set("n", "gy", builtin.lsp_type_definitions, { desc = "Type Definitions" })
    vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Document Symbols" })
    vim.keymap.set("n", "<leader>sS", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })
  end,
}

