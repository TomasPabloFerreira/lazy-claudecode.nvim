return {
  "nvim-lua/plenary.nvim",
  lazy = false,
  config = function()
    local function eslint_fix()
      local filepath = vim.fn.expand("%:p")
      if vim.fn.executable("eslint_d") == 1 then
        vim.fn.jobstart({ "eslint_d", "--fix", filepath }, {
          stdout_buffered = true,
          stderr_buffered = true,
          on_exit = function(_, code)
            vim.schedule(function()
              if code == 0 then
                if not vim.bo.modified then
                  vim.cmd("edit")
                end
                print("✔ Eslint fixed: " .. filepath)
              else
                print("⚠️ Eslint failed")
              end
            end)
          end,
        })
      else
        print("❌ eslint_d not found in PATH")
      end
    end

    -- Manual format trigger
    vim.keymap.set("n", "<leader>f", function()
      vim.cmd("write")
      eslint_fix()
    end, { desc = "Fix file with eslint_d" })

    -- Auto fix on save
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" },
      callback = eslint_fix,
    })
  end,
}

