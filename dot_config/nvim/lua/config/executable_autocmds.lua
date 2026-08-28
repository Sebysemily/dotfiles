-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Forzar Copilot en archivos de Jupyter (.ipynb) manejados por jupytext
vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost" }, {
  pattern = "*.ipynb",
  callback = function()
    vim.defer_fn(function()
      local copilot_ok, copilot = pcall(require, "copilot.command")
      if copilot_ok then
        copilot.enable()
        vim.cmd("Copilot attach")
      end
    end, 100)
  end,
  desc = "Forzar Copilot attach en archivos jupyter notebook",
})
