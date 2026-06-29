return {
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Opciones de configuración
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,
  },
  -- Dependencia para mostrar imágenes en la terminal (requiere ueberzugpp, kitty o wezterm)
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Cambia esto según tu terminal (wezterm, ueberzug)
      integrations = {
        markdown = { enabled = true },
      },
    },
  },
}
