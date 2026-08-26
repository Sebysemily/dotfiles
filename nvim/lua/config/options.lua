-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.sqlite_clib_path = "/usr/lib/x86_64-linux-gnu/libsqlite3.so.0"
vim.g.python3_host_prog = "/home/sebas/miniforge3/envs/mega_base/bin/python"
vim.env.PATH = "/home/sebas/miniforge3/envs/mega_base/bin:" .. vim.env.PATH
-- Forzar a Neovim a leer los parsers de Treesitter
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
-- 🤖 Autocomando para controlar el portapapeles
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = 'Copia al portapapeles del sistema solo si se usó "y" o "x"',
  callback = function()
    -- Obtiene el operador que se usó ('y', 'd', 'x', etc.)
    local operator = vim.v.event.operator
    -- Solo procede si el operador es 'y' (yank) o 'x' (cut)
    if operator == "y" or operator == "x" then
      -- Copia el contenido del registro por defecto (") al registro del sistema (+)
      vim.fn.setreg("+", vim.fn.getreg('"'))
    end
  end,
})
vim.g.ai_cmp = false
