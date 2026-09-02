vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "quarto" },
  callback = function()
    -- Soft Wrap para aprovechar la pantalla en notas académicas
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.colorcolumn = "" -- Sin línea molesta
    vim.opt_local.textwidth = 0 -- Sin hard wrap automático
    
    -- Desactivar mini.pairs en Markdown/Quarto para que no choque con los [[]] de Obsidian
    vim.b.minipairs_disable = true
  end,
})

return {
  -- Ecosistema Quarto
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("quarto").setup({
        debug = false,
        closeHover = true,
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      })
    end,
  },

  -- Integración de Zotero con Telescope
  {
    "jmbuhr/telescope-zotero.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "kkharji/sqlite.lua" },
    config = function()
      require("zotero").setup({
        -- Ruta a tu base de datos de Zotero (por defecto suele ser esta)
        zotero_db_path = vim.fn.expand("~/Documents/zotero/zotero.sqlite")
      })
      require("telescope").load_extension("zotero")
    end,
  },

  -- Zotcite (opcional para completado, pero Telescope usará el de arriba)
  {
    "jalvesaq/zotcite",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require("zotcite").setup({
        filetypes = { "markdown", "quarto", "rmd" }
      })
    end,
  },

  -- Ecosistema Obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = { 
      "BufReadPre *.md", 
      "BufNewFile *.md",
      "BufReadPre *.qmd",
      "BufNewFile *.qmd",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "vault",
          path = "~/Documents/obsidian_main",
        },
      },
      -- Configuración de Plantillas (Templates)
      templates = {
        folder = "5-templates", -- Nombre de la carpeta en tu bóveda donde guardas las plantillas
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        -- Aquí puedes definir variables personalizadas para tus plantillas
        substitutions = {},
      },
      
      -- Asegurar que el autocompletado nativo esté encendido
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      
      -- Asegurar enlaces limpios sin que Obsidian trate de inventar guiones o rutas largas
      preferred_link_style = "wiki",
      
      -- Desactivar la generación de IDs extraños (con guiones) a partir de los títulos
      note_id_func = function(title)
        -- Si das un título, usa exactamente ese título. Si no, genera un ID simple.
        local id = ""
        if title ~= nil then
          id = title
        else
          id = tostring(os.time())
        end
        return id
      end,
      
      -- Opcional: Desactiva la creación automática de este bloque si prefieres usar el tuyo propio siempre
      -- disable_frontmatter = true,
    },
  },

  -- Configuración interna de Neovim para silenciar la advertencia de línea larga (MD013) en md y qmd
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "--stdin" },
        },
      },
    },
  },
}
