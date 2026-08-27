return {
  -- Configura las opciones específicas de Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- opciones: latte, frappe, macchiato, mocha
      transparent_background = false,
    },
  },
  -- Le dice a LazyVim que use Catppuccin por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
