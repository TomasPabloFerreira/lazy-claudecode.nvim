-- Bootstrap Lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Check if Lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
  -- Clone Lazy.nvim repository if not found
  vim.fn.system({
    "git", "clone", "--filter=blob:none", -- Shallow clone without blobs for faster download
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Use stable branch
    lazypath,
  })
end

-- Set space as the leader key for custom key mappings
vim.g.mapleader = " "

-- Relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Search settings
vim.opt.hlsearch = true      -- Highlight search results
vim.opt.incsearch = true     -- Show search matches as you type
vim.opt.ignorecase = true    -- Case-insensitive search
vim.opt.smartcase = true     -- Case-sensitive if uppercase letters used

-- Add Lazy.nvim to runtime path so it can be loaded
vim.opt.rtp:prepend(lazypath)

-- Initialize Lazy.nvim and load plugins from the "plugins" directory
require("lazy").setup("plugins")

-- Configs
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = false,
})
