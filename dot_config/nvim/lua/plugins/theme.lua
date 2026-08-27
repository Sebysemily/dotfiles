-- Integración condicional con Omarchy: Carga dinámica del tema actual
local theme_path = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")

if vim.fn.isdirectory("/usr/share/omarchy") == 1 and vim.fn.filereadable(theme_path) == 1 then
  local f = loadfile(theme_path)
  if f then
    return f()
  end
end

-- Fallback para servidores o cuando no hay tema de Omarchy
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
