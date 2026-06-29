return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
  opts = {
    -- Ajusta esto a donde Mamba guarda tus envs
    anaconda_base_path = os.getenv("HOME") .. "/mambaforge", -- o donde sea tu mamba
    anaconda_envs_path = os.getenv("HOME") .. "/mambaforge/envs",
  },
  keys = {
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Seleccionar Entorno" },
  },
}
