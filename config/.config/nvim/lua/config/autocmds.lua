-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("ReadOnlyWarning", { clear = true }),
  callback = function()
    local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
    if first_line:match("DO NOT EDIT") then
      vim.bo.readonly = true
      vim.notify("This file is marked as DO NOT EDIT. Opened in read-only mode.", vim.log.levels.WARN)
    end
  end,
})
