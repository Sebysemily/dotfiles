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

      -- Evaluador personalizado para celdas de Python
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
          vim.keymap.set("n", "<leader>mc", function()
            local r = vim.api.nvim_win_get_cursor(0)[1]
            local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            local start_line = 1
            for i = r, 1, -1 do
              if lines[i]:match("^# %%%s*") or lines[i]:match("^# %%$") then
                start_line = i
                break
              end
            end
            local end_line = #lines
            for i = r + 1, #lines do
              if lines[i]:match("^# %%%s*") or lines[i]:match("^# %%$") then
                end_line = i - 1
                break
              end
            end
            vim.fn.MoltenEvaluateRange(start_line, end_line)
          end, { desc = "Molten: Evaluar Celda (Python)", buffer = true, silent = true })
        end,
      })
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
      { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Molten: Esconder ventana flotante del output", silent = true },
      {
        "<leader>mO",
        ":MoltenEnterOutput<CR>",
        desc = "Molten: Entrar a la ventana flotante del output",
        silent = true,
      },
      { "<leader>mo", ":MoltenShowOutput<CR>", desc = "Molten: Volver a mostrar Output en Ventana", silent = true },
      { "<leader>mC", ":MoltenReevaluateCell<CR>", desc = "Molten: Reevaluar Celda", silent = true },
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
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    opts = {
      style = "hydrogen",
      output_extension = "auto",
      force_ft = nil,
      custom_language_formatting = {},
    },
  },
}
