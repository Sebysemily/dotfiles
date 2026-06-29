return {
  {
    "benlubas/molten-nvim",

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
    },
  },
  -- ... (aquí sigue tu configuración de image.nvim si la pusiste)
}
