return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = function()
    require("claudecode").setup({})

    -- Guardar automáticamente antes de aplicar un diff (evita error E37)
    vim.api.nvim_create_autocmd("User", {
      pattern = "ClaudeCodePreDiff",
      callback = function()
        if vim.bo.modified then
          vim.cmd("write")
        end
      end,
    })

    -- Recargar buffer después del diff si el archivo fue modificado por Claude
    vim.api.nvim_create_autocmd("User", {
      pattern = "ClaudeCodePostDiff",
      callback = function()
        if not vim.bo.modified then
          vim.cmd("edit")
          vim.notify("🔄 Buffer reloaded with Claude changes", vim.log.levels.INFO)
        else
          vim.notify("⚠ Buffer has unsaved changes, not reloading", vim.log.levels.WARN)
        end
      end,
    })
  end,

  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file from tree",
      ft = { "NvimTree", "neo-tree", "oil" },
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny Claude diff" },
  },
}

