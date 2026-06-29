return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Configuraciones visuales
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_wrap_output = true
    end,
    -- Aquí definimos los atajos de teclado mágicos (todos empiezan con <leader>m)
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Molten: Inicializar Kernel", silent = true },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Molten: Evaluar Línea", silent = true },
      {
        "<leader>me",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = "v",
        desc = "Molten: Evaluar Selección",
        silent = true,
      },
      { "<leader>md", ":MoltenDelete<CR>", desc = "Molten: Borrar Output", silent = true },
      { "<leader>mo", ":MoltenShowOutput<CR>", desc = "Molten: Mostrar Output en Ventana", silent = true },
      { "<leader>mc", ":MoltenReevaluateCell<CR>", desc = "Molten: Evaluar Celda (# %%)", silent = true },
    },
  },
  --   -- Dependencia para mostrar imágenes en la terminal (requiere ueberzugpp, kitty o wezterm)
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
