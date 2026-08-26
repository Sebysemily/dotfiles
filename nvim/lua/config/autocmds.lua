-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- Forzar Copilot en archivos de Jupyter (.ipynb)
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadCmd" }, {
  pattern = "*.ipynb",
  callback = function()
    vim.schedule(function()
      if package.loaded["copilot.command"] then
        require("copilot.command").enable()
      end
    end)
  end,
})
