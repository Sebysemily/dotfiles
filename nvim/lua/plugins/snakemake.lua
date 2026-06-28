return {
  -- 1. Agregamos el plugin específico de Snakemake que encontraste
  {
    "samesense/snakemake.nvim",
    ft = "snakemake", -- Solo se carga cuando abres un Snakefile o archivo .smk
  },
  -- 2. Le decimos a Treesitter que descargue el resaltado de sintaxis exacto
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "snakemake" })
      end
    end,
  },
}
