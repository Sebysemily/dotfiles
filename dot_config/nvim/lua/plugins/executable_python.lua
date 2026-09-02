vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "88"
    vim.opt_local.textwidth = 88
  end,
})

return {
  {
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
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = { enabled = false },
        pyright = {
          enabled = true,
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
              },
            },
          },
        },
      },
    },
  },
}
